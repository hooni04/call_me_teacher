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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 108, 160, 190)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '우리 앱'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 34, 101, 208),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  FilledButton(onPressed: () {}, 
                  style: FilledButton.styleFrom(
		                backgroundColor: Color.fromARGB(255, 83, 85, 197),),
                    child: const Text('교무실')),
                  FilledButton(onPressed: () {}, 
                  style: FilledButton.styleFrom(
		                backgroundColor: Color.fromARGB(255, 83, 85, 197)),
                    child: const Text('1학년실')),
                  FilledButton(onPressed: () {},
                  style: FilledButton.styleFrom(
		                backgroundColor: Color.fromARGB(255, 83, 85, 197)),
                     child: const Text('2학년실')),
                  FilledButton(onPressed: () {}, 
                  style: FilledButton.styleFrom(
		                backgroundColor: Color.fromARGB(255, 83, 85, 197)),
                    child: const Text('3학년실')),
                ],
              ),
              ),       
            Expanded(
              child: Container(),
              flex: 10,
            )
          ],
        ),
      ),
    );
  }
}
