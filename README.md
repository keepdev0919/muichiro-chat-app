# 🗡️ Muichiro Chat App

> 코딩셰프 플러터 조금 매운맛 강의를 따라하면서 제가 좋아하는 귀멸의 칼날 무이치로 캐릭터를 첨가하여 커스터마이징 한 프로젝트입니다.

## 📱 프로젝트 소개

이 프로젝트는 **Flutter**로 개발된 채팅 앱으로, [코딩셰프 플러터 조금 매운맛 강의](https://www.youtube.com/@codingchef)를 기반으로 하여 **귀멸의 칼날**의 **무이치로** 캐릭터 테마를 적용한 커스터마이징 버전입니다.

## ✨ 주요 기능

- 🎨 **무이치로 테마 UI**: 귀멸의 칼날 무이치로 캐릭터를 모티브로 한 아름다운 디자인
- 🔐 **로그인/회원가입**: 사용자 인증 시스템
- 💬 **채팅 기능**: 실시간 메시지 교환
- 🌈 **애니메이션**: 부드러운 UI 전환 효과
- 📱 **반응형 디자인**: 다양한 화면 크기에 최적화

## 🛠️ 기술 스택

- **Frontend**: Flutter
- **Language**: Dart
- **Platform**: iOS, Android
- **State Management**: StatefulWidget
- **UI/UX**: Material Design + 커스텀 디자인

## 🎯 학습 목표

- Flutter 기본 위젯 활용
- 상태 관리 (State Management)
- 애니메이션 구현
- 커스텀 UI 디자인
- 이미지 에셋 관리

## 📸 스크린샷

### 로그인 화면
- 무이치로 배경 이미지
- 투명한 로그인 폼
- 부드러운 애니메이션 효과

### 회원가입 화면
- 동적 색상 변경
- 사용자 친화적 인터페이스

## 🚀 시작하기

### 필요 조건
- Flutter SDK (3.0 이상)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### 설치 및 실행
```bash
# 저장소 클론
git clone https://github.com/keepdev0919/muichiro-chat-app.git

# 프로젝트 디렉토리로 이동
cd muichiro-chat-app

# 의존성 설치
flutter pub get

# 앱 실행
flutter run
```

## 📁 프로젝트 구조

```
lib/
├── config/
│   └── palette.dart          # 색상 팔레트
├── screens/
│   └── main_screen.dart      # 메인 화면 (로그인/회원가입)
├── main.dart                 # 앱 진입점
└── image/                    # 이미지 에셋
    ├── 무이치로.png
    └── red.jpg
```

## 🎨 커스터마이징 포인트

### 무이치로 테마 적용
- **배경 이미지**: 무이치로 캐릭터 이미지를 전체 화면 배경으로 사용
- **색상 팔레트**: 하늘색/파란색 계열로 통일
- **텍스트**: "안녕하세요! 저는 무이치로 입니다" 등 캐릭터 테마 메시지

### UI/UX 개선
- **투명도 효과**: 배경 이미지가 보이도록 폼에 투명도 적용
- **애니메이션**: 탭 전환 시 부드러운 색상 변화
- **그림자 효과**: 입체감 있는 UI 요소

## 📚 참고 자료

- [코딩셰프 플러터 강의](https://www.youtube.com/@codingchef)
- [Flutter 공식 문서](https://flutter.dev/docs)
- [귀멸의 칼날 공식 사이트](https://kimetsu.com/)

## 🤝 기여하기

이 프로젝트는 학습 목적으로 제작되었습니다. 개선 사항이나 버그 리포트는 언제든 환영합니다!

## 📄 라이선스

이 프로젝트는 개인 학습 목적으로 제작되었습니다.

---

**"안녕하세요! 저는 무이치로 입니다"** 🗡️

*귀멸의 칼날의 무이치로와 함께하는 Flutter 채팅 앱*