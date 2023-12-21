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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
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
                          "student",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          ),
                        ),
                        Container(
                         height : 2,
                          width:55,
                          color: Colors.redAccent,
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
                          "teacher",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          ),
                        ),
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
              Expanded(child: Container(), flex: 0,)
          ],
        ),
      ),
    );
  }
}