// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/authentication_api.dart';
import 'package:flutter_api_rest/data/authentication_client.dart';
import 'package:flutter_api_rest/pages/pages.dart';
import 'package:flutter_api_rest/utils/utils.dart';
import 'package:flutter_api_rest/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authenticationAPI = GetIt.instance<AuthenticationAPI>();
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email='', _password='';

  Future<void> _submit() async{
    final isOk = _formKey.currentState?.validate();
    if(isOk!){
      ProgressDialog.show(context);
      
      final response =  await _authenticationAPI.login(
        email: _email, 
        password: _password
      );
      ProgressDialog.dissmiss(context);
      if(response.data!=null){
        await _authenticationClient.saveSession(response.data!);
        Navigator.pushNamedAndRemoveUntil(
          context, 
          HomeScreen.routeName, 
          (_) => false
        );
      }else{
        String message = response.error!.message;
        if(response.error!.statusCode == -1){
          message = 'Bad network';
        }else if(response.error!.statusCode == 403){
          message = 'Invalid Password';
        }else if(response.error!.statusCode == 404){
          message = 'Invalid Email';
        }

        Dialogs.alert(
          context, 
          title: 'Error', 
          description: response.error!.message
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 80,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTable?430:350,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputField(
                keyboardType: TextInputType.emailAddress,
                label: 'EMAIL ADDRESS',
                fontSize: responsive.dp(responsive.isTable?1.2:1.4),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);
        
                  return regExp.hasMatch(text ?? '')
                    ? null
                    : 'Invalid email';
                } ,
              ),
              SizedBox(height: responsive.dp(3),),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black38
                    )
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InputField(
                        obscureText: true,
                        label: 'PASSWORD',
                        borderEnable: false,
                        fontSize: responsive.dp(responsive.isTable?1.2:1.4),
                        onChanged: (text) {
                          _password = text;
                        },
                        validator: (text) {
                          if( text != null && text.length>= 6) return null;
                          return 'La contraseña debe ser de 6 caracteres';
                        } ,
                      ),
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: responsive.dp(responsive.isTable?1.2:1.5)
                        ),
                      ),
                      onPressed: (){}
                    )
                  ],
                ),
              ),
              SizedBox(height: responsive.dp(5),),
              //Buttom signin
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  onPressed: _submit,
                  color: Colors.pinkAccent,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5)
                    ), 
                  ),
                ),
              ),
              SizedBox(height: responsive.dp(2),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to Friendly Desi?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: responsive.dp(1.6)
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: responsive.dp(1.6),
                        color: Colors.pinkAccent
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: responsive.dp(10),),
        
            ],
          ),
        ),
      ),
    );
  }
}