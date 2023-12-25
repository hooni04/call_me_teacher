import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget{
  const MessagePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [ 
              const Text("Teacher"), 
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.search)
              )
            ],
          )
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Container(), flex:  10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 4, 9),
                    style: BorderStyle.solid,
                    width: 3,
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
	                          context: context,
	                          builder: (BuildContext context) {
		                          return AlertDialog(
                                title: const Text('호출',textAlign: TextAlign.center,),
                                content: Column(
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(255, 0, 4, 9),
                                            style: BorderStyle.solid,
                                            width: 3,
                                          )
                                        ),
                                        child : Column(
                                          children : [
                                            const Expanded( //제목
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: '제목'
                                                ),
                                                textAlignVertical: TextAlignVertical.top,
                                              ),
                                            ),
                                            const Expanded( //학번
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: '학번'
                                                ),
                                                textAlignVertical: TextAlignVertical.top,
                                              ),
                                            ),
                                            Expanded( //내용
                                              flex: 7,
                                              child: Column(
                                                children: [
                                                  const Expanded(
                                                    flex: 100,
                                                    child: TextField(
                                                      keyboardType: TextInputType.multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                        hintText: '내용'
                                                      ),
                                                      textAlignVertical: TextAlignVertical.top,
                                                    ),
                                                  ),
                                                  Expanded(child: Container(), flex: 0,)
                                                ],
                                              ),
                                            ),
                                            ],
                                          ),
                                        ),
                                     ),
                                     Expanded( //취소와 전송 버튼
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(left: 10, right: 15,top:10),
                                            child: TextButton(
                                              onPressed: () {Navigator.pop(context);}, 
                                              style: TextButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 244, 216, 248)
                                              ),
                                              child: const Text('취소'),
                                              ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 10, right: 15,top:10),
                                            child: TextButton(
                                              onPressed: () {}, 
                                              style: TextButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 244, 216, 248)
                                              ),
                                              child: const Text('전송'),
                                              ),
                                          )
                                        ],
                                      ),
                                     ),
                                  ],
                                ),
                              );
	                          }
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    const Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: ''
                        ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}