💊 Good Medicine (굿 메디슨)
"당신의 약, 안전한가요?" > 의약품 처방전이나 약 봉투를 촬영하여, 함께 복용하면 위험한 약품(상호작용)이나 부작용 정보를 알려주는 AI 헬스케어 애플리케이션입니다.

📅 프로젝트 현황
시작일: 2025년 12월

현재 단계: Day 2 - UI 기반 다지기 및 하드웨어 연동 완료 🚀

상태: 개발 진행 중

🛠 Tech Stack
Framework: Flutter (Dart)

Architecture: MVVM based Clean Architecture

Libraries: camera, google_mlkit_text_recognition, permission_handler

Backend: FastAPI (Python 3.12+)

📂 Project Structure (Day 2 기준)
Plaintext

good_medicine/
├── android/            # 안드로이드 네이티브 설정 (카메라 권한 등)
├── ios/                # iOS 네이티브 설정
├── lib/                # Flutter App Source Code
│   ├── main.dart       # 앱 진입점 (Theme & RootTab 연결)
│   └── src/
│       ├── app/        # 전역 네비게이션 설정 (root_tab.dart)
│       ├── models/     # 데이터 모델 (PillModel 등)
│       ├── viewmodels/ # 상태 관리 로직 (3일차 예정)
│       ├── views/      # UI 화면 (HomeView, ScanView 구현 완료)
│       ├── services/   # OCR 및 API 서비스 로직 (3일차 예정)
│       └── widgets/    # 공통 재사용 위젯
├── server/             # FastAPI Backend Server (Python)
│   └── main.py         # 서버 진입점
└── README.md           # 프로젝트 가이드