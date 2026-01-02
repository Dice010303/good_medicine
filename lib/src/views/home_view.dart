import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60), // 상단 여백

            // 1. 메인 로고 및 아이콘 섹션
            const Icon(
              Icons.local_hospital_rounded,
              size: 100,
              color: Color(0xFF00C896), // 민트색 (의료 서비스의 상징)
            ),
            const SizedBox(height: 20),
            const Text(
              'Good Medicine',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142), // 신뢰감을 주는 짙은 회색
                letterSpacing: 0, // 문자 간격
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '안전한 복약을 돕는 스마트 파트너',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 48),

            // 2. 안내 카드 섹션 (추후 데이터 연결 예정)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text(
                    '오늘 복용할 약이 있나요?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text('하단의 스캔 버튼을 눌러 처방전을 등록해보세요.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}