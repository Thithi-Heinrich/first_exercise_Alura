import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String image;
  final int dificuldade;

  const Task(this.nome, this.dificuldade, {super.key, this.image = 'src'});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int color = 0;
  Color hashcolor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: hashcolor),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    Container(
                      width: 73,
                      height: 75,
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.blue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)))),
                          onPressed: () {
                            setState(() {
                              if (nivel < (widget.dificuldade * 10)) {
                                nivel++;
                              } else if(nivel == (widget.dificuldade * 10) && color < 6){
                                nivel = 0;
                                color++;
                                hashcolor = colorChanging(color);
                              }
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up, color: Colors.white),
                              Text(
                                'Up',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(100, 255, 255, 255),
                          value: (widget.dificuldade > 0)
                              ? ((nivel / (widget.dificuldade)) / 10)
                              : 1,
                        )),
                    Text('Nível: $nivel',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
