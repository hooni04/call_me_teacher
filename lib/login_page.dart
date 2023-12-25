import 'dart:convert';
import 'package:call_the_teacher/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isTeacher = false;

  TextEditingController idCon = TextEditingController();
  TextEditingController pwCon = TextEditingController();

  void requestLogin(BuildContext context) {
    final url = Uri.parse('https://bongrimyaja.com/teaca/login');
    http.post(url, body: {
      'ID': idCon.text,
      'PW': pwCon.text
    }).then((res) {
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) {
              return MyHomePage(
                id: idCon.text,
                name: data['name'], 
                isTeacher: data['isTeacher']
              );
            },
          )
        );
      } else {
        showAlert(
          context, 
          text: (res.body.toString() == '0') 
              ? '아이디 확인 부탁' 
              : '비번 확인 부탁'
        );
      }
    }).catchError((e) {
      showAlert(context, text: '인터넷 확인 부탁!');
    });
  }

  void showAlert(BuildContext context, { required String text}) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          content: Text(text),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 4, 9),
                    style: BorderStyle.solid,
                    width: 3,
                  )
                ),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                      children: [
                        GestureDetector( //학생
                          onTap: () {
                            setState(() {
                              isTeacher = false;
                            });
                          },
                          child: Column(
                            children: [
                              const SizedBox( height: 20 ),
                              Text(
                                "student",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: isTeacher ? Colors.grey : Colors.black
                                ),
                              ),
                              if(!isTeacher)
                              Container(
                                height : 2,
                                width:55,
                                color: Colors.redAccent,
                              )
                            ],
                          ),
                        ),
                        GestureDetector( //선생님
                          onTap: () {
                            setState(() {
                              isTeacher = true;
                            });
                          },
                          child: Column(
                            children: [
                              const SizedBox( height: 20 ),
                              Text(
                                "teacher",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: !isTeacher ? Colors.grey : Colors.black
                                ),
                              ),
                              if(isTeacher)
                              Container(
                                height : 2,
                                width:55,
                                color: Colors.redAccent,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if(!isTeacher) //학생 로그인
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right:15, left:15, top: 50),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: idCon,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.account_circle),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    hintText: '학번',
                                  ),
                                )
                              ],
                            )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right:15,left:15,top: 50),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: pwCon,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock,),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    hintText: '비번',
                                  ),
                                )
                              ],
                            )
                            ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right:15, left:15, top: 50),
                          width: 500,
                          height: 50,
                          child : TextButton(
                            onPressed: () { requestLogin(context); }, 
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 204, 204, 240),
                            ),
                            child: const Text('로그인'),
                          ),
                        ),
                      ],
                    ),
                    if(isTeacher) // 선생님 로그인
                    Column(
                      children :[
                        Container(
                          margin: const EdgeInsets.only(right:15,left:15,top: 50),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: idCon,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.account_circle),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    hintText: '이름',
                                  ),
                                )
                              ],
                            )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right:15,left:15,top: 50),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: pwCon,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    hintText: '비번',
                                  ),
                                )
                              ],
                            )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right:15,left:15,top: 50),
                          width: 500,
                          height: 50,
                          child : TextButton(
                            onPressed: () { requestLogin(context); }, 
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 204, 204, 240),
                            ),
                            child: const Text('로그인'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}