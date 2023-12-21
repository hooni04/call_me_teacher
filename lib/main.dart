import 'package:call_the_teacher/login_paege.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:call_the_teacher/message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 54, 8, 118)),
        useMaterial3: true,
      ),
      // home: const login_paege() //const MyHomePage(title: '우리 앱'),
      home: const MyHomePage(title: '우리 앱')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Consume {
  Consume();
  final int value = 100;
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const teachers = ["이승훈", "이가현"];
    const subjects = ["물리", "윤사"];

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox( height: 15,),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 4, 9),
                    style: BorderStyle.solid,
                    width: 3,
                  )
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: ''
                        ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                      flex: 5,
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    )
                  ],
                ),
              ),
            ),  
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ 
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('교무실'),),
                    ),
                    ),
                  
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('1학년실'),),
                    ),
                    ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('2학년실'),),
                    ),
                    ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 15),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('3학년실'),),
                    ),
                    ),
                ],
              ),
              ),       
            Expanded(
              flex: 10,
              child: Container(
                child: ListView.builder(
                  itemCount: teachers.length,
                  itemBuilder: (context, index) {
                    return MenuItemButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                             return const Message();
                          },)
                        );
                      }, 
                      style: MenuItemButton.styleFrom(
                        minimumSize: const Size(0, 80)
                      ),
                      // trailingIcon: const Text("Hello"),
                      leadingIcon: const Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 50,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${teachers[index]} 선생님",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "${subjects[index]} 담당",
                                style: const TextStyle(
                                  color: Colors.grey
                                )
                              )
                            ],
                          ),
                        ],
                      )
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}