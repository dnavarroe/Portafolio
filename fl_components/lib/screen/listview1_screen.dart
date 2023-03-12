
import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {

  final options = const['Free Fire','Call Of Duty','Pokemon Go','League Of legend'];
   
  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Listview 1')),
      ),
      body: ListView(
        children:  [
        
          ...options.map(
            (e) => ListTile(
              title: Text(e),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ).toList(),

          const Divider()

          
          // ListTile(
          //   leading: Icon(Icons.account_balance_wallet_sharp),
          //   title: Text('Hola mundo'),
          // )
          
        ],
      )
    );
  }
}