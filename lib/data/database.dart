import 'package:hive_flutter/hive_flutter.dart';

class DataBase {

  List toDoList = [];

  final _db = Hive.box('Todo');

  void loadData(){
    if (_db.get('TodoList')!=null) {
      toDoList=_db.get('TodoList');
    }


  }
  void updateDataBase(){
    _db.put('TodoList', toDoList);
    
    
  }
}
