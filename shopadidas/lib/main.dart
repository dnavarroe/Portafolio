import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopadidas/models/cart.dart';
import 'package:shopadidas/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
    ),
    );
  }
}