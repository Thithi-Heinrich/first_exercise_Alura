import 'package:first_exercise/Screens/form_screen.dart';
import 'package:first_exercise/Screens/initial_screen.dart';
import 'package:first_exercise/data/task_inherited.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/Tarefas",
      onGenerateRoute: (RouteSettings settings) {
        if(settings.name == '/Tarefas'){
        return MaterialPageRoute (builder: (context) => TaskInherited(child: const InitialScreen()));}
        else if(settings.name == '/addTask'){
        return MaterialPageRoute (builder: (context) => FormScreen(taskContext: settings.arguments));}
        return null;
      },
    );
  }
}
