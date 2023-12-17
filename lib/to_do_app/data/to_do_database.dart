import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList=[];
  //reference hive
  final _myBox=Hive.box("myBox");

  //create Initial databas
  createInitailData(){
    //list of task
     toDoList = [
      ["New Task-1", true],
      ["New Task-1", true],
    ];
  }

  //load the data
  void loadData(){
    toDoList=_myBox.get("ToDoList");
  }

  //update database
  void updateDatabase(){
    _myBox.put("ToDoList", toDoList);

  }  //update database
  void updateDatabaseText(){
    _myBox.put("ToDoList", toDoList);

  }




}