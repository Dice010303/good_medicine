// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GoodMedicineApp());
}

class GoodMedicineApp extends StatelessWidget {
  const GoodMedicineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Medicine',
      // 디버그 배너(우측 상단 띠) 제거
      debugShowCheckedModeBanner: false,
      
      // 앱 전체 테마 설정
      theme: ThemeData(
        useMaterial3: true,
        // 의료 앱에 어울리는 민트/그린 계열 색상 (안정, 치유)
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C896), 
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto', // 기본 폰트
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      
      // 앱 실행 시 첫 화면
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_hospital, size: 80, color: Color(0xFF00C896)),
              SizedBox(height: 20),
              Text(
                'Good Medicine',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
              ),
              SizedBox(height: 10),
              Text('구조 및 테마 설정 완료'),
            ],
          ),
        ),
      ),
    );
  }
}