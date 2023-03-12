import 'package:flutter/material.dart';

import 'package:game_tetris/screens/Game.dart';
import 'package:game_tetris/widgets/espaciodejuego.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetris',
      initialRoute: 'Game',
      debugShowCheckedModeBanner: false,
      routes: {
        'Game' :(_) => const Game(),
      },
    );
  }
}