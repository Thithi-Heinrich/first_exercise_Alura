import 'package:first_exercise/Components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  int nivelGlobal = 0;
  int colorGlobal = 0;

  final List<Task> taskList = [
    Task('Aprender Flutter', 4, image: 'assets/images/aprender_flutter.jpg'),
    Task('Fazer Exercícios', 5, image: 'assets/images/exercicio.png'),
    Task('Estudar História', 2, image: 'assets/images/estudar_historia.jpg'),
    Task('Cozinhar', 1, image: 'assets/images/cozinhar.jpg'),
    Task('Buscar o neném', 1, image: 'assets/images/buscar_nenem.jpg'),
    Task('Trabalhar', 3, image: 'assets/images/trabalhar.png'),
    Task('Jogar vídeogame', 2, image: 'assets/images/jogar.png'),
    Task('Tirar soneca', 1, image: 'assets/images/soneca.jpg')
  ];
  void newTask(String name, int difficulty, {String? photo}){
taskList.add(Task(name, difficulty, image: photo.toString(),));
  }

  int sumDifficulty(){
    int sumDifficulty = 0;
    for (int i=0; i < taskList.length; i++){
      sumDifficulty += taskList[i].dificuldade;
    }
    return sumDifficulty;
  }

  void nivelGlobalUpgrade (){
    if(nivelGlobal<(sumDifficulty()*10)){
      nivelGlobal++;
    } else if(nivelGlobal == (sumDifficulty()+10) && colorGlobal < 6){
      nivelGlobal = 0;
      colorGlobal++;
    }
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No taskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
