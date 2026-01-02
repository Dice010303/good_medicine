import 'package:flutter/material.dart';
import 'package:good_medicine/src/views/scan_view.dart';
import 'home_view.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  // 2. 현재 선택된 인덱스를 저장할 변수 (0: 홈, 1: 스캔, 2: 약 상자)
  int _selectedIndex = 0;

  // 3. 전환될 화면들을 리스트로 관리 (나중에 실제 View 파일들로 교체 예정)
  final List<Widget> _pages = [
    // const : 컴파일 시점에 메모리에 한번 생성되어 박제 -- 저장값 재사용
    const HomeView(), // 홈 화면
    const ScanView(), // 카메라 화면
    const Center(child: Text('내 약 상자 화면 (준비 중)', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 4. IndexedStack: 여러 화면을 겹쳐두고 index에 맞는 화면만 보여줌
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      // 5. BottomNavigationBar 구현
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 현재 눌린 탭의 번호 연결
        onTap: (int index) {
          // 6. 탭을 누르면 실행되는 함수
          setState(() {
            _selectedIndex = index; // 새 번호로 상태 업데이트 -> build 함수 재실행
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          // 7. 각 탭 아이템 선언
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_rounded),
            label: '약 스캔',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_rounded),
            label: '내 약 상자',
          ),
        ],
      ),
    );
  }
}