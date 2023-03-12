import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Play
        _Boton(
          child: const Text('PLAY', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),), 
          onTap: () {}
        ),
        //Mover a la izquierda
        _Boton(
          child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,), 
          onTap: () {}
        ),
        //Mover a la derecha
        _Boton(
          child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,), 
          onTap: () {}
        ),
        //Rotar pieza
        _Boton(
          child: const Icon(Icons.replay_outlined, color: Colors.black,), 
          onTap: () {}
        ),
      ],
    );
  }
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