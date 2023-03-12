import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const Pixel({super.key,  this.child,  this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final lado = (size.width-55)/10 ;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: lado,
        width: lado,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color?? Colors.black ,),
        child: child,
      ),
    );
  }
}

