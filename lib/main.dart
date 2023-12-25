import 'dart:convert';
import 'package:call_the_teacher/login_page.dart';
import 'package:flutter/material.dart';
import 'package:call_the_teacher/message.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 54, 8, 118)
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage() 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ 
    super.key,
    required this.id,
    required this.name,
    required this.isTeacher
  });
  final String id;
  final String name;
  final bool isTeacher;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Student {
  final String snum;
  final String name;
  Student(this.snum, this.name);
}

class Teacher {
  final String name;
  final String id;
  final String subejct;
  Teacher(this.id, this.name, this.subejct);
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    final url = Uri.parse('wss://bongrimyaja.com')
        .replace(queryParameters: {
          'id': widget.id,
          'isTeacher': widget.isTeacher.toString()
        });

    channel = WebSocketChannel.connect(url, protocols: [ "teaca" ]);

    if (widget.isTeacher) {
      channel.ready.then((_) {
        channel.stream.listen((msg) { 
          final data = json.decode(msg);

          final url = Uri.parse('https://bongrimyaja.com/teaca/student')
              .replace(queryParameters: { 'ID': data['id'] });
          http.get(url).then((res) {
            showDialog(
              context: context, 
              builder: (context) {
                return AlertDialog(
                  title: Text('${data['id']} ${res.body} 학생의 호출'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data['title'], 
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text( data['content'])
                    ],
                  )
                );
              },
            );
          }).catchError(print); 
        });
      });
    }
  }

  Future<List<Teacher>> getTeachers() async {
    try {
      final url = Uri.parse('https://bongrimyaja.com/teaca/teachers');
      final res = await http.get(url);

      final datas = json.decode(res.body) as List;
      return datas.map((e) => Teacher(e['id'], e['name'], e['subject'])).toList();
    } catch(e) {
      print(e);
      return List.empty();
    }
  }

  Future<List<Student>> getStudents() async {
    try {
      final url = Uri.parse('https://bongrimyaja.com/teaca/students');
      final res = await http.get(url);

      final datas = json.decode(res.body) as List;
      return datas.map((e) => Student(e['id'], e['name'])).toList();
    } catch(e) {
      print(e);
      return List.empty();
    }
  }
  
  Widget studentList(List<Student> students) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return MenuItemButton(
          onPressed: () {},
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
                    "${students[index].name} 학생",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    students[index].snum,
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
    );
  }

  Widget teacherList(List<Teacher> teachers) {
    return ListView.builder(
      itemCount: teachers.length,
      itemBuilder: (context, index) {
        return MenuItemButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController titleCon = TextEditingController();
                TextEditingController contentCon = TextEditingController();

                return AlertDialog(
                  title: const Text('호출',textAlign: TextAlign.center,),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleCon,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '제목'
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                      const SizedBox(height: 20,),
                      TextField(
                        controller: contentCon,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '내용'
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ],
                  ),
                  actions: [
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
                        onPressed: () {
                          final data = {
                            'id': teachers[index].id,
                            'title': titleCon.text,
                            'content': contentCon.text
                          };
                          channel.sink.add(json.encode(data));
                          Navigator.pop(context);
                        }, 
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 244, 216, 248)
                        ),
                        child: const Text('호출'),
                        ),
                    )
                  ],
                );
              }
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
                    "${teachers[index].name} 선생님",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "${teachers[index].subejct} 담당",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    (widget.isTeacher) ? '선생님' : '학생',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }, 
                    icon: const Icon(Icons.logout_rounded)
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('로그아웃')
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("선생님 호출기"),
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
                    color: const Color.fromARGB(255, 0, 4, 9),
                    style: BorderStyle.solid,
                    width: 3,
                  )
                ),
                child: Row(
                  children: [
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
		                  backgroundColor: const Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('교무실'),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: const Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('1학년실'),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: const Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('2학년실'),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 15),
                      child : TextButton(onPressed: () {}, 
                    style: TextButton.styleFrom(
		                  backgroundColor: const Color.fromARGB(255, 219, 219, 220),),
                      child: const Text('3학년실'),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: FutureBuilder(
                future: (widget.isTeacher) ? getStudents() : getTeachers(), 
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return (widget.isTeacher)
                        ? studentList(snapshot.data! as List<Student>)
                        : teacherList(snapshot.data! as List<Teacher>);
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}