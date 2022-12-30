import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

 List todoList = [];

  //calling the box 
  final _mybox = Hive.box("mybox");

     
  void createInitailData(){
    todoList = [
      ['Add New Task Using + button',false],
    ];
  }

  //load data from database
  void  loadData(){
  todoList = _mybox.get("TODOLIST");
  }

  //update the database 
  void updateDatabase(){
    _mybox.put("TODOLIST", todoList);
  }
}