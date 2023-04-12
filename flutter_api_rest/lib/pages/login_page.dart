import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  static String routeName = 'LoginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkd = responsive.wp(80);
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
                  top: -pinkd*0.4,
                  right: -pinkd*0.2,
                  child: Circule(
                    diametro: pinkd, 
                    colors: const [Colors.pinkAccent, Colors.pinkAccent]
                  )
                ),
              
                //Orange Circule
                Positioned(
                  top: -oarnged*0.55,
                  left: -oarnged*0.15,
                  child: Circule(
                    diametro: oarnged, 
                    colors: [Colors.orange, Colors.orange[900]!]
                  )
                ),
              
                //Text of welcome
                Positioned(
                  top: pinkd*0.35,
                  child: Column(
                    children: [
                      IconContainer(
                        size: responsive.wp(20),
                      ),
                      SizedBox(height: responsive.dp(3),),
                      Text(
                        'Hello Again.\nWelcome Back Nakama!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: responsive.dp(1.7),
              
                        ),
                      ),
                    ],
                  )
                ),
              
                //Form
                const LoginForm()
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}