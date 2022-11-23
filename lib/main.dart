


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_Data.dart';

import 'home.dart';

Future<void> main() async{
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(TaskAdapter().typeId))
    {
      Hive.registerAdapter(TaskAdapter());
    }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (BuildContext context) => TaskData(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            
            home: HomeScreen() ,
          );
        },
      ),
    );
  }
}
