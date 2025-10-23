# Claude Code 프로젝트 설정

## 작업 완료 알림
- 작업을 완료할 때마다 다음 명령어로 macOS 알림을 보내주세요:
```bash
osascript -e "display notification \"작업 완료되었습니다\" with title \"작업 완료\" sound name \"Glass\""
```

## 코드 스타일 가이드
- 코드 작성시 유지보수, 확장성이 쉽도록 코드를 작성해주세요
- 특정 행동을 하는 함수 or 클래스 등을 작성할때는 그게 어떤 역할을 하는지 주석을 달아주세요
- 코드를 수정하면 안쓰고 있는 코드는 없는지 확인하고 쓸모없는코드는 지워주세요

## 언어 설정
- Always respond in Korean (항상 한국어로 응답)

## Flutter/Dart 특정 규칙
- Flutter 위젯 작성 시 const 생성자를 최대한 활용하여 성능 최적화
- 상태 관리 로직과 UI 로직을 분리하여 작성
- Firebase 관련 코드는 에러 핸들링을 필수로 포함
