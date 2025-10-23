import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser; //User라는 파베에서 제공하는 데이터타입이다. 얘 사용하면 유저의 정보를 가져올수있음

  @override //사용자가 채팅화면에 들어오자마자 사용자 정보를 확인할 수 있도록 한다.
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user =  _authentication.currentUser;
        if(user != null) {
          loggedUser = user;
          print(loggedUser!.email);
        } 
      }
      catch (e) {
        print(e);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _authentication.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Chat Screen')),
    );
  }
}