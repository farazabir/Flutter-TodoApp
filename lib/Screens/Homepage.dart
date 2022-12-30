import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/Database.dart';
import 'package:todo/utils/DialogBox.dart';
import '../utils/Todolist.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //calling the hive box 
  final _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if(_mybox.get("TODOLIST")==null){
      db.createInitailData();
    }else{
      db.loadData();
    }
    super.initState();
  }
 
  //text controller 
  final _controller = TextEditingController();



  //Checking checkbox
  void checboxChanged(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task 
  void SavenewTask(){
    setState(() {
     db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();    
  }

  //add new task 
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller:_controller ,
        onSave: SavenewTask,
        onCancel: ()=>Navigator.of(context).pop(),
      );
    });
    db.updateDatabase();
  }


  //delete task 
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffEEEEEE),
      appBar: AppBar(backgroundColor:Color(0xfff00ADB5),
      title: Center(child: Text(
        "TO DO",
        style: GoogleFonts.robotoMono(fontWeight:FontWeight.w800),
      )),
      elevation: 0,
       ),
       floatingActionButton: FloatingActionButton(
        onPressed: createNewTask ,
        child: Icon(Icons.add),
        backgroundColor: Color(0xfff00ADB5) ,
       ),
      body:ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: db.todoList.length,
        itemBuilder:(context, index) {
          return Todolist(taskName: db.todoList[index][0],
           taskCompleted: db.todoList[index] [1],
            onChanged:(value) => checboxChanged(value,index),
            deleteFunction: (context)=> deleteTask(index),
            );
        },
      )
    );
  }
}