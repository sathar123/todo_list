



import 'package:flutter/material.dart';
import 'package:todo_list/constents.dart';

class TaskTile extends StatelessWidget {
 final bool isChecked;
 final String taskTitle;
 final Function callback;
 final Function onlongpress;
 TaskTile({required this.isChecked,required this.taskTitle, required this.callback, required this.onlongpress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:(){
        onlongpress();
      },
      title: Text(taskTitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: isChecked ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(
        activeColor: bgcolor,
        value: isChecked,
        onChanged: (newVaue){
          callback(newVaue);
        },
      ),
    );
  }
}

