import 'package:flutter/material.dart';

class Message extends StatelessWidget{
  const Message({ super.key });

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
                icon: Icon(Icons.search)
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
                    color: Color.fromARGB(255, 0, 4, 9),
                    style: BorderStyle.solid,
                    width: 3,
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                      ),
                    Expanded(
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