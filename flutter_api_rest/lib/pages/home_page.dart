

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/account_api.dart';
import 'package:flutter_api_rest/data/authentication_client.dart';
import 'package:flutter_api_rest/models/user.dart';
import 'package:flutter_api_rest/pages/login_page.dart';
import 'package:flutter_api_rest/utils/logs.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
   
  static String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _accontApi = GetIt.instance<AccountAPI>();

  User? _user;

  @override
  void initState() {
    super.initState();
    
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUser();
    });
  }


  Future<void> _loadUser() async{
    final response = await _accontApi.getUserInfo();
    
    if(response.data!=null){
      _user = response.data!;
      setState(() {});
    }
  }

  Future<void> _signOut() async{
    await _authenticationClient.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context, 
      LoginPage.routeName, 
      (_) => false
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_user==null) CircularProgressIndicator(),
            if(_user!=null) Column(
              children: [
                Text(_user!.id),
                Text(_user!.email),
                Text(_user!.username),
                Text(_user!.createdAt.toIso8601String())
              ],
            ),

            MaterialButton(
              onPressed: _signOut,
              child: const Text('Sign Out'),
              )
          ],
        ),
      )
    );
  }
}