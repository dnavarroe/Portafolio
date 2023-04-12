import 'dart:async';
import 'dart:convert';

import 'package:flutter_api_rest/api/authentication_api.dart';
import 'package:flutter_api_rest/models/authentication_response.dart';
import 'package:flutter_api_rest/models/session.dart';
import 'package:flutter_api_rest/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationClient{
  final FlutterSecureStorage _secureStorage;
  final AuthenticationAPI _authenticationAPI;

  Completer? _completer;

  AuthenticationClient(this._secureStorage, this._authenticationAPI);

  void _complete(){
    if(_completer!=null && _completer!.isCompleted){
      _completer!.complete();
    }
  }


  Future<String?> get accessToken async{
    if(_completer!= null){
      await _completer!.future;
    }

    _completer = Completer();

    final data = await _secureStorage.read(key: 'SESSION');
    if(data!=null){
      final session = Session.fromJson(jsonDecode(data));

      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = session.createdAt;
      final int expiresIn = session.expiresIn;
      final int diff = currentDate.difference(createdAt).inSeconds;

      Logs.p.i('session life time ${expiresIn-diff}');

      if(expiresIn-diff>= 60){
        _complete();
        return session.token;
      }

      final response = await _authenticationAPI.refreshToken(session.token);
      
      if(response.data!=null){
        await saveSession(response.data!);
        _complete();
        return response.data!.token;
      }
      _complete();
      return null;
    }
    _complete();
    return null;;
  } 

  Future<void> saveSession( AutheticationResponse autheticationResponse) async{
    final Session session = Session(
      token: autheticationResponse.token, 
      expiresIn: autheticationResponse.expiresIn, 
      createdAt: DateTime.now()
    );



    final data = jsonEncode(session.toJson());
    await _secureStorage.write(key: 'SESSION', value: data);
  }


  Future<void> signOut( ) async{

    await _secureStorage.deleteAll();
  }
}