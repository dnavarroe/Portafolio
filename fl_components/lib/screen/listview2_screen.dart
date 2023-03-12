
import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {

  final options = const['Free Fire','Call Of Duty','Pokemon Go','League Of legend'];
   
  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Listview 2')),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.deepPurple,),
          onTap: (){

          },
      ), 
        separatorBuilder: (_, __) => const Divider(), 
        itemCount: options.length
      )
    );
  }
}