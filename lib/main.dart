import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muichiro_chat_app/screens/main_screen.dart';
import 'firebase_options.dart';

/// 앱의 진입점
/// Firebase를 초기화하고 MyApp을 실행합니다.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화 - 플랫폼별 설정을 자동으로 적용
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'YeongwolTTF', // 전체 앱에 YeongwolTTF 폰트 적용
      ),
      home: LoginSignupScreen(),
    );
  }
}
