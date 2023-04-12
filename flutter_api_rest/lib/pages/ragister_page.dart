import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = 'RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkd = responsive.wp(85);
    final double oarnged = responsive.wp(57);

    return  Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.grey[200],
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                //Pink circule
                Positioned(
                  top: -pinkd*0.3,
                  right: -pinkd*0.2,
                  child: Circule(
                    diametro: pinkd, 
                    colors: const [Colors.pinkAccent, Colors.pinkAccent]
                  )
                ),
              
                //Orange Circule
                Positioned(
                  top: -oarnged*0.35,
                  left: -oarnged*0.15,
                  child: Circule(
                    diametro: oarnged, 
                    colors: [Colors.orange, Colors.orange[900]!]
                  )
                ),
              
                //Text of welcome
                Positioned(
                  top: pinkd*0.22,
                  child: Column(
                    children: [
                      Text(
                        'Hello Nakama.\nSign up to get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.dp(1.7),
              
                        ),
                      ),
                      SizedBox(height: responsive.dp(5),),
                      AvatarButton(imageSize: responsive.wp(30),)
                    ],
                  )
                ),
                const RegisterForm(),
                Positioned(
                  top: 15,
                  left: 15,
                  child: SafeArea(
                    child: CupertinoButton(
                      color: Colors.black12,
                      padding: const EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)
                    ),
                  ),
                ),
              
                //Register Form
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}