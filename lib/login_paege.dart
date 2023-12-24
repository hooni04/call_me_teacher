  import 'package:call_the_teacher/main.dart';
import 'package:flutter/material.dart';

class login_paege extends StatefulWidget {
  const login_paege({super.key});

  @override
  State<login_paege> createState() => _login_paegeState();
}

class _login_paegeState extends State<login_paege> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child:  Container(
                margin: const EdgeInsets.all(10),
                child :Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [
                  GestureDetector( //학생
                    onTap: () {
                    setState(() {
                      isSignupScreen = false;
                    });
                  },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "student",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: isSignupScreen ? Colors.grey : Colors.black
                          ),
                        ),
                        if(!isSignupScreen)
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
                      isSignupScreen = true;
                    });
                  },
                   child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "teacher",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: !isSignupScreen ? Colors.grey : Colors.black
                          ),
                        ),
                         if(isSignupScreen)
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
            if(!isSignupScreen) //학생 로그인
            Container( 
            child: Column(
              children :[
                Container(
              margin: EdgeInsets.only(right:15,left:15,top: 50),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          hintText: '학번',
                      ),
                    )
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(right:15,left:15,top: 50),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          hintText: '비번',
                      ),
                    )
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(right:15,left:15,top: 50),
              width: 500,
              height: 50,
              child : TextButton(
                onPressed: () {
                Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                             return const MyHomePage(title: '우리 앱',);
                          },)
                        );
              }, 
                    style: TextButton.styleFrom(
		                  backgroundColor: Color.fromARGB(255, 204, 204, 240),),
                      child: const Text('로그인'),),
            ),
              ],
            )
            ),
            if(isSignupScreen) // 선생님 로그인
            Container(
            child: Column(
              children :[
                Container(
              margin: EdgeInsets.only(right:15,left:15,top: 50),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          hintText: '과목',
                      ),
                    )
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(right:15,left:15,top: 50),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0)
                            ),
                          ),
                          hintText: '비번',
                      ),
                    )
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(right:15,left:15,top: 50),
              width: 500,
              height: 50,
              child : TextButton(
                onPressed: () {
                Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                             return const MyHomePage(title: '우리 앱',);
                          },)
                        );
              }, 
                    style: TextButton.styleFrom(
		                  backgroundColor: Color.fromARGB(255, 204, 204, 240),),
                      child: const Text('로그인'),),
            ),
              ],
            )
            ),
              ],
                ),
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 4, 9),
                    style: BorderStyle.solid,
                    width: 3,
                  )
                ),
          ),
              ),
              Expanded(child: Container(), flex: 0,),
          ],
        ),
      ),
    );
  }
}