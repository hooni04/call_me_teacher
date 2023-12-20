import 'package:flutter/material.dart';

class Message extends StatelessWidget{
  const Message({ super.key });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("이건 두번째 페이지 입니다!"),
      ),
    );
  }
}