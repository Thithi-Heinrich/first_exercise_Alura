import 'package:first_exercise/data/task_inherited.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.blue[50],
        child: ListView(
            children: TaskInherited.of(context).taskList,
           ),
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Navigator.of(context).pushNamed("/addTask", arguments: context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
