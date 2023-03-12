import 'package:flutter/material.dart';
import 'package:game_tetris/widgets/widgets.dart';

class EspacioDeJuego extends StatelessWidget {
  final List<int> newPieza;
  final Color colorPieza;
  final List<int> piezasEnPantalla;
  const EspacioDeJuego({Key? key, required this.newPieza, required this.colorPieza, required this.piezasEnPantalla}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10), 
      itemCount: 180,
      itemBuilder: (_, int i) {
        if (newPieza.contains(i)) {
          return Pixel(color: colorPieza);
        }
        else if(piezasEnPantalla.contains(i)){
          return Pixel(color: colorPieza,);
        } 
        else{
          return const Pixel();
        }

      }    
    );
  }
}

