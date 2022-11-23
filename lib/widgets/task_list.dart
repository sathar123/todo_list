import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:todo_list/model/task_Data.dart';
import 'package:todo_list/widgets/task_tile.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(

      builder: (BuildContext context, taskData, Widget? child) {
        return  ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, int index) {
              return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                callback: (checkboxstate) {
                taskData.UpdateTask(index);
                },
                onlongpress: () async {
                final dstatus =  await taskData.Delete(index);
                if ( dstatus!){
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Successfully Deleted!',
                  );
                }
                },
              );
            });
      },

    );
  }
}
