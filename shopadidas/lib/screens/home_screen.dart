import 'package:flutter/material.dart';
import 'package:shopadidas/screens/screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset(
                  'assets/Adidad_logo.png',
                  height: 160,
                ),
              ),

              const SizedBox(height: 48,),

              //title
              const Text(
                'Impossible is nothing',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 24,),
              //sub title
              const Text(
                ' Impossible is just a big word thrown around by small men who find it easier to live in the world',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48,),

              //star now button

              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => const ShopScreen())
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}