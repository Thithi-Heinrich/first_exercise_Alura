import 'package:first_exercise/Components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    const Task('Aprender Flutter', 4, image: 'assets/images/aprender_flutter.jpg'),
    const Task('Fazer Exercícios', 5, image: 'assets/images/exercicio.png'),
    const Task('Estudar História', 2, image: 'assets/images/estudar_historia.jpg'),
    const Task('Cozinhar', 1, image: 'assets/images/cozinhar.jpg'),
    const Task('Buscar o neném', 1, image: 'assets/images/buscar_nenem.jpg'),
    const Task('Trabalhar', 3, image: 'assets/images/trabalhar.png'),
    const Task('Jogar vídeogame', 2, image: 'assets/images/jogar.png'),
    const Task('Tirar soneca', 1, image: 'assets/images/soneca.jpg')
  ];
  void newTask(String name, int difficulty, {String? photo}){
taskList.add(Task(name, difficulty, image: photo.toString(),));
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
