import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    // 카메라 설정
    // 카메라 구동 시간 있기때문에 비동기
    try {
      final cameras = await availableCameras();
      // 사용가능한 카메라 장치 리스트 가져옴
      if (cameras.isEmpty) return;
      // 사용가능 카메라 없을시 종료

      _controller = CameraController(
        cameras.first, // 첫번째 인덱스 - 후면 카메라
        ResolutionPreset.high, // 해상도 1080
        enableAudio: false, // 소리 녹음 X
      );
      setState(() {
        _initializeControllerFuture = _controller!.initialize();
      }); // 카메라 하드웨어를 깨우는 비동기 작업
    } catch (e) {
      print("카메라 초기화 에러: $e");
    }
  }


    @override
  void dispose() { // 메모리 할당 해제
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) { // 비동기 작업 진행상태
          if (snapshot.connectionState == ConnectionState.done)
          // 하드웨어 준비시 DONE
            {
            return Stack( // 카메라 영상 + 버튼 추가
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox( // 렌즈 화면
                  width: double.infinity,
                  height: double.infinity,
                  child: CameraPreview(_controller!),
                  // 컨트롤러가 받아오는 실시간 렌즈 영상
                ),

                Positioned( // 사진 촬영 버튼
                  bottom: 50,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      try {
                        final image = await _controller!.takePicture();
                        // 이미지 변환
                        ScaffoldMessenger.of(context).showSnackBar(
                          // SnackBar : 화면 하단에 잠시 나타났다가 몇 초 뒤 사라짐
                          SnackBar(content: Text("사진 촬영 성공: ${image.path}")),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Icon(Icons.camera_alt, color: Colors.black),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
