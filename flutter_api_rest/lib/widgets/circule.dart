
import 'package:flutter/material.dart';

class Circule extends StatelessWidget {
  final double diametro;
  final List<Color> colors;

  const Circule({super.key, required this.diametro, required this.colors}) : assert(diametro>0), assert(colors.length>1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diametro,
      height: diametro,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}