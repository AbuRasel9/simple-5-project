import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_project/to_do_app/data/to_do_database.dart';
import 'package:simple_project/to_do_app/utils/dialog_box.dart';
import 'package:simple_project/to_do_app/utils/to_do_tile.dart';

class HomePageToDo extends StatefulWidget {

  const HomePageToDo({super.key});

  @override
  State<HomePageToDo> createState() => _HomePageToDoState();
}

class _HomePageToDoState extends State<HomePageToDo> {
  //reference the hive box

  final _myBox= Hive.box("myBox");
  @override
  void initState() {
    super.initState();


    //if user 1st time open app show default value
    if(_myBox.get("ToDoList")==null){
      db.createInitailData();
    }
    else{
      db.loadData();
    }
  }




  //instance database
  ToDoDatabase db=ToDoDatabase();

  //controller
  final _controller = TextEditingController();

  //create new task
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      //
      return DialogBox(
        taskController: _controller, onSave: saveTask, onCancell: () {
        Navigator.pop(context);
      },);
    });
  }


  //checkbox tap
  void checkBoxChange(bool? value, int index) {
    setState(() {
     db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }




  //task save
  void saveTask() {
    setState(() {
      db.toDoList.add([_controller.text, true]);
    });
    Navigator.pop(context);
    _controller.text="";
    db.updateDatabase();

  }


  //delete task
   deleteTask(index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              deleteFunction:(context)=> deleteTask(index),
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChange: (value) => checkBoxChange(value, index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          createNewTask();
        },
      ),
    );
  }
}
