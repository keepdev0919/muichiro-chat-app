import 'package:flutter/material.dart';
import 'package:muichiro_chat_app/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muichiro_chat_app/screens/chat_screen.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _authentication = FirebaseAuth.instance;


  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String useremail = '';
  String userpassword = '';
  
  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
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
                        '하주(霞柱), 무이치로입니다',
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
              key: ValueKey(1),
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
                child : SingleChildScrollView(
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
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(1),
                                validator: (value) {
                                  if(value!.isEmpty || value.length < 4) {
                                    return '4자 이상 적어주세요..^^';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  username = value!;
                                },
                                onChanged: (value) {
                                  username = value;
                                },
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
                                    fontSize: 18, color: Palette.textColor1),
                                errorStyle: TextStyle(
                                    fontSize: 20, color: Colors.red), // 에러 텍스트 크기 키움
                                contentPadding: EdgeInsets.all(10)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                key: ValueKey(2),
                                validator: (value) {
                                  if(value!.isEmpty || !value.contains('@')) {
                                    return '올바른 이메일 값을 입력해주세요';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  useremail = value!;
                                },
                                // onChanged는 제거 - onSaved만으로 충분함
                                // onChanged: (value) {
                                //   useremail = value;
                                // },
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
                                hintText: 'User email',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Palette.textColor1),
                                errorStyle: TextStyle(
                                    fontSize: 20, color: Colors.red), // 에러 텍스트 크기 키움
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            obscureText: true, // 비밀번호 숨김 처리
                            key: ValueKey(3),
                            onSaved: (value) {
                              userpassword = value!;
                            },
                            // onChanged는 제거 - onSaved만으로 충분함
                            // onChanged: (value) {
                            //   userpassword = value;
                            // },
                            validator: (value) {
                              if(value!.isEmpty || value.length < 6) {
                                return '비밀번호는 최소 6자 이상 입력해야합니다';
                              }
                              return null;
                            },
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
                            hintText: 'User password',
                            hintStyle: TextStyle(
                                fontSize: 18, color: Palette.textColor1),
                            errorStyle: TextStyle(
                                fontSize: 20, color: Colors.red), // 에러 텍스트 크기 키움
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
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(4),
                                validator: (value) {
                                  if(value!.isEmpty || !value.contains('@')) {
                                    return '올바른 이메일 값을 입력해주세요';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  useremail = value!;
                                },
                                onChanged: (value) {
                                  useremail = value;
                                },
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
                                hintText: 'User email',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Palette.textColor1),
                                errorStyle: TextStyle(
                                    fontSize: 20, color: Colors.red), // 에러 텍스트 크기 키움
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            key: ValueKey(5),
                                obscureText: true, // 비밀번호 숨김 처리
                                onSaved: (value) {
                                  userpassword = value!;
                                },
                                // onChanged는 제거 - onSaved만으로 충분함
                                // onChanged: (value) {
                                //   userpassword = value;
                                // },
                                validator: (value) {
                                  if(value!.isEmpty || value.length < 6) {
                                    return '비밀번호는 최소 6자 이상 입력해야합니다'; // 파베 authentication 사용할경우에는 비밀번호가 최소 6자 이상이어야함.
                                  }
                                  return null;
                                },
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
                                hintText: 'User password',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Palette.textColor1),
                                errorStyle: TextStyle(
                                    fontSize: 20, color: Colors.red), // 에러 텍스트 크기 키움
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
            ),
            //텍스트 폼 필드
            AnimatedPositioned(
              key: ValueKey(2),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? MediaQuery.of(context).size.height * 0.4 + 230 + 10 : MediaQuery.of(context).size.height * 0.4 + 200 + 10,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () async {
                  if(isSignupScreen) {
                  _tryValidation(); // signup의 유저네임, 이메일, 패스워드의 유효성 검사를 실시하여 모든값이 유효하면 onSaved함수를 통해 각 변수에 해당 유저가 작성한 값을 저장함.
                  
                  try {
                    final newUser = await _authentication.createUserWithEmailAndPassword(
                    email: useremail, 
                    password: userpassword
                    );

                    if (newUser.user != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    } 
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('이메일과 비밀번호를 재확인 해주세요'),
                        backgroundColor: Colors.red,
                      ),
                    );


                  }
                };
                if(!isSignupScreen) {
                  _tryValidation();
                  try {
                  final newUser = await _authentication.signInWithEmailAndPassword(
                    email: useremail, 
                    password: userpassword
                  );
                  if (newUser.user != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                  }
                }catch (e) {
                  print(e);
                  }
                }
                },
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
            ),
            //전송버튼
            AnimatedPositioned(
              key: ValueKey(3),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
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
            //구글 로그인 버튼
          ],
        ),
      ));
  }
}
