
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/model/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks =[];

  Future<void> AddTask(String newTaskTitle) async{
   final taskdb = await  Hive.openBox<Task>('task_db');
    final value = Task(name: newTaskTitle);
    taskdb.add(value);
    getAllTask();
    notifyListeners();

  }

  Future<void> getAllTask () async {
    final taskdb = await  Hive.openBox<Task>('task_db');
    tasks.clear();
    tasks.addAll(taskdb.values);
    notifyListeners();
  }

  Future<void> UpdateTask(int index) async {
    final taskdb = await  Hive.openBox<Task>('task_db');
    var utask = tasks[index];
    utask.toggleChange();
    taskdb.putAt(index,utask);
    getAllTask();

  }

 // void UpdateTask(Task task){
 //
 //    task.toggleChange();
 //    notifyListeners();
 // }

Future<bool?> Delete(int index)async{
  final taskdb = await  Hive.openBox<Task>('task_db');
  var dtask = tasks[index];

    if(dtask.isDone){
      taskdb.deleteAt(index);
      getAllTask();
      notifyListeners();
     return true;
    }

 }

  int get taskCount {
    return tasks.length;
  }
}