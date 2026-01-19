import 'package:flutter/material.dart';
import 'home_view.dart';
import 'scan_view.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});
  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int _index = 0;
  final _screens = [const HomeView(), const ScanView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: '홈'),
          NavigationDestination(icon: Icon(Icons.camera), label: '스캔'),
        ],
      ),
    );
  }
}