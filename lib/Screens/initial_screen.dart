import 'package:first_exercise/data/task_inherited.dart';
import 'package:flutter/material.dart';

import '../Components/colors.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({super.key});


  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.recycling,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    print('${TaskInherited.of(context).nivelGlobal}, ${TaskInherited.of(context).colorGlobal} e ${TaskInherited.of(context).sumDifficulty()}');

                  });
                },
                tooltip:
                MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: colorChanging(TaskInherited
              .of(context)
              .colorGlobal),
          title: Column(
            children: [
              const Text(
                'Tarefas',
                style: TextStyle(color: Colors.white),
              ),
              LinearProgressIndicator(
                  color: Colors.white,
                  backgroundColor:
                  const Color.fromARGB(100, 255, 255, 255),
                  value:(TaskInherited.of(context).nivelGlobal / (TaskInherited.of(context).sumDifficulty() / 10))

              )],
          )
    ),
    body: Container(
    color: Colors.blue[50],
    child: ListView(
    padding: const EdgeInsets.only(bottom: 70),
    children: TaskInherited.of(context).taskList,
    ),
    ),
    floatingActionButton: FloatingActionButton.small(
    onPressed: () {
    Navigator.of(context).pushNamed("/addTask", arguments: context);
    },
    child: const Icon(Icons.add))
    ,
    );
  }
}
