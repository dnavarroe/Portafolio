

import 'package:flutter/material.dart';

class AppTheme {

  //color primario
  static const Color primary =  Colors.purple;

  //Tema claro
  static final ThemeData lightTheme = ThemeData.light().copyWith(
        //color primario
        primaryColor: Colors.purple,

        //AppBar theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0
        ),

        // TextButon theme
        textButtonTheme:  TextButtonThemeData(

          style: TextButton.styleFrom(primary: primary)
        ),
        //FloatingAcctionButtons
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary
        ),
        //ElevatedButton
        elevatedButtonTheme:   ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: const StadiumBorder(),
            elevation: 0
        )
      ), 
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),

        )
    );
  //Tema ocuro
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
        //color primario
        primaryColor: Colors.purple,

        //AppBar theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.black,

         // TextButon theme
        textButtonTheme:  TextButtonThemeData(

          style: TextButton.styleFrom(primary: primary)

        ),

        //FloatingAcctionButtons
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary
        ),
        //ElevatedButton
        elevatedButtonTheme:   ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: const StadiumBorder(),
            elevation: 0
        )
      ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),

        )


      );

       
  



}