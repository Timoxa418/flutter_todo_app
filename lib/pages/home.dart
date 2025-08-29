import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String user;
  List todoList = [];




@override
  void initState() {
    super.initState();

    todoList.addAll(['buy milk', 'купить картошку']);

  }

  void _menuOpen (){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Меню')),
          body: Row(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, child: Text('Главаня')),
              Padding(padding: EdgeInsets.only(left: 15)),
              
            ],)
        );
      })
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Список', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: _menuOpen, 
          ),                  
        ],
      ),
      body: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                   key: Key(todoList[index]),
                   child: Card(
                     child: ListTile(
                    title: Text(todoList[index]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_sweep,
                        color: Colors.black,
                      ),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),    
                ),
              ),
              onDismissed: (diraction){
                setState(() {
                        todoList.removeAt(index);
                });
              },

            );
          }
        ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed:() {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Добавить элимент'),
            content: TextField(
              onChanged: (String value) {
                user = value;
              },
            ),
            actions: [
              ElevatedButton(onPressed:(){
                setState(() {
                  todoList.add(user);
                });
                  
                  Navigator.of(context).pop();
                }, child: Text('Добавить'))
            ],
          );
        });
    },
      child: Icon(
        Icons.add_box,
        color: Colors.white,
      )
    ),
    );

  }
  
}