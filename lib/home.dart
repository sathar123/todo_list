import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/constents.dart';
import 'package:todo_list/datamodel.dart';
import 'package:todo_list/model/task_Data.dart';
import 'package:todo_list/widgets/task_list.dart';

import 'add_task_screen.dart';
import 'model/task.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<TaskData>(context).getAllTask();
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 60),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 20),
                  child: Text(
                    'Todoey',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Consumer<TaskData>(
                    builder: (context, taskData , child){
                      return RichText(text: TextSpan(
                        children: [
                          TextSpan(text: '${taskData.taskCount}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          TextSpan(text: ' Task',style: TextStyle(fontSize: 20))
                        ]
                      ));
                      //   Text(
                      //   '${taskData.taskCount} Task',
                      //   style: TextStyle(color: Colors.white, fontSize: 20),
                      // );
                    },

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TaskList(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {

            showModalBottomSheet(
                isScrollControlled: true,
                context: context, builder:(context) => AddTaskScreen());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}


