import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import '../viewmodels/scan_viewmodel.dart';
import '../viewmodels/pill_viewmodel.dart';
import '../widgets/pill_card.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});
  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((c) {
      _controller = CameraController(c[0], ResolutionPreset.medium);
      _controller!.initialize().then((_) => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    final scanVM = context.watch<ScanViewModel>();
    final pillVM = context.watch<PillViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("약 스캔")),
      body: Column(
        children: [
          if (_controller != null && _controller!.value.isInitialized)
            SizedBox(height: 300, child: CameraPreview(_controller!)),
          if (scanVM.isLoading) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: scanVM.scannedPills.length,
              itemBuilder: (c, i) {
                final pill = scanVM.scannedPills[i];
                return PillCard(
                  pill: pill,
                  onTap: () async {
                    bool warning = await scanVM.checkWarning(pill, pillVM.myPills);
                    if (warning) {
                      _showWarning(context, scanVM.warningMessage!);
                    } else {
                      pillVM.savePill("user_test_123", pill);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("저장되었습니다.")));
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final img = await _controller!.takePicture();
          scanVM.processImage(img.path);
        },
        child: const Icon(Icons.camera),
      ),
    );
  }

  void _showWarning(BuildContext context, String msg) {
    showDialog(context: context, builder: (c) => AlertDialog(title: const Text("주의"), content: Text(msg)));
  }
}