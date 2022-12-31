import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/utils/dialogBox.dart';
import 'package:todo_list/utils/todo_list.dart';

import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataBase db = DataBase();
  Random random = Random();
  String selectedCategory = '';
  TextEditingController _taskcontroller = TextEditingController();
  TextEditingController _categorycontroller = TextEditingController();

  List tasksColors = [
    Colors.greenAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.deepPurple[300],
    Colors.redAccent,
  ];

  void onChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveTask() {
    setState(() {
      db.toDoList.add([_taskcontroller.text, false]);
      _taskcontroller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  void addTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return DialogBox(
          controller: _taskcontroller,
          hint: 'Add To Do Task',
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }),
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title:  Text(
            'Tasks',
            style: TextStyle(color: Colors.grey[600]),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: addTask,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[300],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: db.toDoList.length,
                  padding: const EdgeInsets.only(bottom: 100),
                  itemBuilder: ((context, index) {
                    return Task(
                      onChange: (value) => onChange(value, index),
                      tasksColor: tasksColors[random.nextInt(5)],
                      val: db.toDoList[index][1],
                      task: db.toDoList[index][0],
                      deleteFunction: (context) => deleteTask(index),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
