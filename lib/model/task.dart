
import 'package:hive_flutter/hive_flutter.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String name;

  @HiveField(1)
  bool isDone;

  Task({required this.name,this.isDone = false,});



  void toggleChange(){
    isDone = !isDone;
  }
}