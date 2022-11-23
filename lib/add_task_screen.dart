

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_Data.dart';

class AddTaskScreen extends StatelessWidget {
  late String newtitle;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Column(
mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),

            Text('Add Task',style: TextStyle(color: Colors.deepPurple,fontSize: 30),textAlign: TextAlign.center,),
            TextField(
             onChanged: (newval){
               newtitle = newval;
             },
              cursorColor: Colors.deepPurple,
              autofocus: true,textAlign: TextAlign.center,
            decoration: InputDecoration(

            ),),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                ),
                onPressed: (){

            Provider.of<TaskData>(context,listen: false).AddTask(newtitle);
            Navigator.pop(context);
            }, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
