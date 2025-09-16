import 'package:flutter/material.dart';
import 'package:yummy_chat_lecture1/config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          // 배경 이미지 - 화면 전체를 꽉 채움
          Positioned.fill( //positioned는 child 무조건 있어야함
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/무이치로.png'), 
                    fit: BoxFit.cover),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '방해되니까 얼른 도망쳐주지 않을래?',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 30,
                        color: Palette.activeColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      isSignupScreen ? 'Signup to continue' : 'Login to continue',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.0,
                        color: Palette.activeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //배경
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: MediaQuery.of(context).size.height * 0.4, // 화면 하단으로 이동
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: EdgeInsets.all(20.0),
              height: isSignupScreen ? 280.0 : 250.0,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9), // 투명도 추가
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (!isSignupScreen)
                            // 선택된 화면일 때 선 표시
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.blue[400],
                              )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.blue[400],
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  if(isSignupScreen)
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                //focusedborder는 포커스되었을 때도 enabledborder와 동일한 스타일로 표시하려고 사용
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                hintText: 'User name',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                hintText: 'email',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(10)),
                          )
                        ],
                      ),
                    ),
                  ),
                  if(!isSignupScreen)
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                hintText: 'email',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(10)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //텍스트 폼 필드
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignupScreen ? MediaQuery.of(context).size.height * 0.4 + 230 + 10 : MediaQuery.of(context).size.height * 0.4 + 200 + 10,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue[300]!, Colors.blue[600]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //전송버튼
          Positioned(
            top: isSignupScreen ? MediaQuery.of(context).size.height * 0.4 + 280 + 10 + 90 + 20 : MediaQuery.of(context).size.height * 0.4 + 250 + 10 + 90 + 20,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isSignupScreen ? 'or Signup with' : 'or Login with',
                    style: TextStyle(
                      fontSize: 16, // fontSize를 TextStyle 안으로 이동
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: Size(155, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Colors.blue[500]
                  ),
                  icon: Icon(Icons.add),
                  label: Text(
                    'Google',
                    style: TextStyle(
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
