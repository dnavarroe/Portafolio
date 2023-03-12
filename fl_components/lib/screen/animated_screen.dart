import 'package:flutter/material.dart';
import 'dart:math';
class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

   double  _width = 110;
   double _height = 110;
   Color _color = Colors.pink;
   BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void changeShape(){
    setState(() {
      final random = Random();

       _width = random.nextInt(300).toDouble();
       _height = random.nextInt(300).toDouble();

       _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
       _borderRadius =
          BorderRadius.circular(random.nextInt(100).toDouble() +10 );
    });

    }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Animated Container')
      ),
      ),
      body: Center(
         child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
         )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_circle_outline, size: 40,)),
    );
  }
}