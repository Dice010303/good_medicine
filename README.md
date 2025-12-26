# 💊 Good Medicine (굿 메디슨)

> **"당신의 약, 안전한가요?"** > 의약품 처방전이나 약 봉투를 촬영하여, 같이 복용하면 위험한 약품(상호작용)이나 부작용 정보를 알려주는 헬스케어 애플리케이션입니다.

## 📅 프로젝트 기간
- **시작일**: 2025년 12월
- **상태**: 개발 진행 중 (Day 1)

## 🛠 Tech Stack

### Client (App)
- **Framework**: Flutter (Latest)
- **Language**: Dart
- **Design Pattern**: MVVM based Clean Architecture

### Server (Backend)
- **Framework**: FastAPI
- **Language**: Python 3.12+
- **Infrastructure**: Uvicorn

### Infra & Tools
- **BaaS**: Firebase (Auth, Analytics)
- **IDE**: VS Code (Development), Android Studio (Emulator/Build)
- **VCS**: Git & GitHub

---

## 📂 Project Structure

```text
good_medicine/
├── android/            # Android Native 설정
├── ios/                # iOS Native 설정
├── lib/                # Flutter App Source Code
│   ├── main.dart       # 앱 진입점 (Theme 설정)
│   └── src/            # Clean Architecture 구조
│       ├── app/        # 전역 설정
│       ├── models/     # 데이터 모델
│       ├── views/      # UI 화면
│       ├── viewmodels/ # 상태 관리 로직
│       ├── services/   # API 및 서비스 로직
│       └── widgets/    # 재사용 위젯
├── server/             # FastAPI Backend Server
│   ├── main.py         # 서버 진입점
│   └── venv/           # 파이썬 가상환경 (Ignored)
└── README.md           # 프로젝트 설명서