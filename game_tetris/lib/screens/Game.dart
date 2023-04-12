import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_tetris/widgets/espaciodejuego.dart';
import 'package:game_tetris/widgets/Botones.dart';



class Game extends StatefulWidget {
  const Game({super.key});
  @override
  State<Game> createState() => _GameState();}

class _GameState extends State<Game> {
  
  Random random = Random();
  static List<List<int>> piezas = [
    [4,5,6,15],
    [4,14,24,23],
    [4,5,15,16],
    [4,5,14,15],
    [5,6,14,15],
    [5,15,25,26],
    [5,15,25,35]
  ];

  static List<Color> piezasColor = [
    Colors.purple,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.cyan
  ];

  static List<int> piezaEnJuego = [];
  static List<int> piezasEnPantalla = [];

  static int p = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
              children:  [
                Expanded(child: EspacioDeJuego(
                  colorPieza: piezasColor[0], 
                  newPieza: piezaEnJuego, 
                  piezasEnPantalla: piezasEnPantalla,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Play
                    _Boton(
                      onTap: starGame,
                      child: const Text('PLAY', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)
                    ),
                    //Mover a la izquierda
                    _Boton(
                      onTap: moveLeft,
                      child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,)
                    ),
                    //Mover a la derecha
                    _Boton(
                      onTap: moveRigth,
                      child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,)
                    ),
                    //Rotar pieza
                    _Boton(
                      onTap: moveDown,
                      child: const Icon(Icons.replay_outlined, color: Colors.black,)
                    ),
                  ],
                )
              ],
          ),
      ),
    );
  }

  void moveRigth(){
    
    bool condicion2 = piezasEnPantalla.contains(piezaEnJuego[0]+1)||piezasEnPantalla.contains(piezaEnJuego[1]+1)||piezasEnPantalla.contains(piezaEnJuego[2]+1)||piezasEnPantalla.contains(piezaEnJuego[3]+1);
    bool condiciond = piezaEnJuego.contains(9) || piezaEnJuego.contains(19) ||piezaEnJuego.contains(29) ||piezaEnJuego.contains(39) ||piezaEnJuego.contains(49) ||piezaEnJuego.contains(59) ||piezaEnJuego.contains(69) ||piezaEnJuego.contains(79) ||piezaEnJuego.contains(89) ||piezaEnJuego.contains(99) ||piezaEnJuego.contains(109) ||piezaEnJuego.contains(119) ||piezaEnJuego.contains(129) ||piezaEnJuego.contains(139) ||piezaEnJuego.contains(149) ||piezaEnJuego.contains(159) ||piezaEnJuego.contains(169) ||piezaEnJuego.contains(179);
    if(!condiciond && !condicion2){
      for(int i = 0; i < piezaEnJuego.length; i++){
      piezaEnJuego[i]+= 1;
      setState(() {});
    }
    }
  }

  void moveLeft(){
    bool condicion2 = piezasEnPantalla.contains(piezaEnJuego[0]-1)||piezasEnPantalla.contains(piezaEnJuego[1]-1)||piezasEnPantalla.contains(piezaEnJuego[2]-1)||piezasEnPantalla.contains(piezaEnJuego[3]-1);
    bool condiciond = piezaEnJuego.contains(0) || piezaEnJuego.contains(10) ||piezaEnJuego.contains(20) ||piezaEnJuego.contains(30) ||piezaEnJuego.contains(40) ||piezaEnJuego.contains(50) ||piezaEnJuego.contains(60) ||piezaEnJuego.contains(70) ||piezaEnJuego.contains(80) ||piezaEnJuego.contains(90) ||piezaEnJuego.contains(100) ||piezaEnJuego.contains(110) ||piezaEnJuego.contains(120) ||piezaEnJuego.contains(130) ||piezaEnJuego.contains(140) ||piezaEnJuego.contains(150) ||piezaEnJuego.contains(160) ||piezaEnJuego.contains(170);
    if(!condiciond && !condicion2){
      for(int i = 0; i < piezaEnJuego.length; i++){
      piezaEnJuego[i]-= 1;
      setState(() {});
    }
    }
  }

  void moveDown(){
    setState(() {});
    for(int i = 0; i < piezaEnJuego.length; i++){
      piezaEnJuego[i]+= 10;
    }
  }

  void rotarPieza( List<int> pieza ){
    for(int i = 0; i < piezaEnJuego.length; i++){
      piezaEnJuego[i]+= 1;
      setState(() {
      });
    }
  }

  void starGame(){
    setState(() {});
    piezaEnJuego = newPieza();
    const duration = Duration( milliseconds: 100);
    Timer.periodic(
      duration, (Timer timer) { 
        if(hitFloor()==false){
          moveDown();
        }else{
          for(int i in piezaEnJuego)
            {piezasEnPantalla.add(i);};
          piezaEnJuego = newPieza();
        }
      }
    );
  }

  bool hitFloor(){
    setState(() {});
    bool condicion2 = piezasEnPantalla.contains(piezaEnJuego[0]+10)||piezasEnPantalla.contains(piezaEnJuego[1]+10)||piezasEnPantalla.contains(piezaEnJuego[2]+10)||piezasEnPantalla.contains(piezaEnJuego[3]+10);
    bool condicion = piezaEnJuego.contains(170)||piezaEnJuego.contains(171)||piezaEnJuego.contains(172)||piezaEnJuego.contains(173)||piezaEnJuego.contains(174)||piezaEnJuego.contains(175)||piezaEnJuego.contains(176)||piezaEnJuego.contains(177)||piezaEnJuego.contains(178)||piezaEnJuego.contains(179);
    if(condicion || condicion2){
      return true;
    }else{
      return false;
    }
  }

  List<int> newPieza(){
    p++;
    return piezas[p%7];
  }



  
  /*
  0-->  x
        x
        x
        x

  1-->  x x x x

  2-->  x
        x
        x x
  
  3-->  x x x
        x

  4-->  x x
          x
          x

  5-->      x
        x x x

          x x
  6-->  x x        

  7-->  x
        x x
          x
  
  8-->  x x
        x x

  9-->  x x
          x x

  10->    x
        x x
        x

  11->    x
          x
        x x

  12->  x
        x x x

  13->  x x
        x
        x
  
  14->  x x x
            x

  15-> x x x
         x
  
         x
  16-> x x
         x

         x
  17-> x x x

        x
  18->  x x
        x
  */  
}

class _Boton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const _Boton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(10)),
          child: Center(child: child),
      ),
      ));
  }
}