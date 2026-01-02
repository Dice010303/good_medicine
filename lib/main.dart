import 'package:flutter/material.dart';
import 'src/views/root_tab.dart';

void main() {
  runApp(const GoodMedicineApp());
}

class GoodMedicineApp extends StatelessWidget {
  const GoodMedicineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Medicine',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        // SeedColor를 통해 앱 전체의 색상 조화를 자동으로 맞춥니다.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007AFF), // 신뢰를 주는 메디컬 블루
          brightness: Brightness.light,
        ),
        // 전역 텍스트 스타일 설정 (선택 사항)
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // 매우 밝은 회색 배경
      ),

      // 2. 진입점 설정: 앱이 켜지자마자 RootTab(하단 바가 있는 화면)을 보여줍니다.
      home: const RootTab(),
    );
  }
}