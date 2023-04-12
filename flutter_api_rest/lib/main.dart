import 'package:flutter/material.dart';
import 'package:flutter_api_rest/helpers/dependency_injection.dart';
import 'package:flutter_api_rest/pages/pages.dart';
import 'package:flutter/services.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Rest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        LoginPage.routeName:(context) => const LoginPage(),
        RegisterPage.routeName:(context) => const RegisterPage(),
        HomeScreen.routeName:(context) => const HomeScreen(),
        SplashPage.routeName:(context) => const SplashPage()
      },
    );
  }
}

