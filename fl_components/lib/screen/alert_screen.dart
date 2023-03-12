import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return  CupertinoAlertDialog(
          title: const Text('The One Piece Is Real'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('CHIHAHAHAHAHAHA'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Ok'))
          ],
        );
      });
  }

  void displayDialogAndroid(BuildContext context){

    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return   AlertDialog(
          elevation: 0,
          title: const Text('The One Piece Is Real'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)), 
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('CHIHAHAHAHAHAHA'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Ok'))
          ],
        );
      }

  );

  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
         child: ElevatedButton(
          onPressed:() => Platform.isAndroid 
          ? displayDialogAndroid(context)
          : displayDialogIOS(context), 
          child: const  Text('Show Alert')
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: (){
          Navigator.pop(context);
        }),
    );
  }
}