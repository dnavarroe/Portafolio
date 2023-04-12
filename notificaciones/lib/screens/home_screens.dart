import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  static String routename = 'Home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: const Center(
        child:  Text('Home Screen') 
      ),
    );
  }
}