
import 'package:flutter_api_rest/helpers/http.dart';
import 'package:flutter_api_rest/helpers/http_response.dart';
import 'package:flutter_api_rest/models/authentication_response.dart';

class  AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  Future<HttpResponse<AutheticationResponse>> register({
    required String username, 
    required String email,
    required String password
  }) {
    return _http.request<AutheticationResponse>(
      '/api/v1/register', 
      method: 'POST', 
      data: {
          "username":username,
          "email":email,
          "password":password
      },
      parser: (data){
        return AutheticationResponse.fromJson(data);
      },
    );
  }
  
  Future<HttpResponse<AutheticationResponse>> login({
    required String email,
    required String password
  }) {
    return _http.request<AutheticationResponse>(
      '/api/v1/login', 
      method: 'POST', 
      data: {
          "email":email,
          "password":password
      },
      parser: (data){
        return AutheticationResponse.fromJson(data);
      },
    );

  }

  Future<HttpResponse<AutheticationResponse>> refreshToken(String expiredToken) {
    return _http.request<AutheticationResponse>(
      '/api/v1/refresh-token', 
      method: 'POST', 
      headers: {
        'token':expiredToken
      },
      parser: (data){
        return AutheticationResponse.fromJson(data);
      },
    );
  }
}
