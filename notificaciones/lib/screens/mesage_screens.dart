import 'package:flutter/material.dart';

class MesageScreen extends StatelessWidget {

  static  String  routename = 'Mesage';
   
  const MesageScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mesage'),
      ),
      body: Center(
         child: Text('$arg', style: const TextStyle(fontSize: 30),),
      ),
    );
  }
}