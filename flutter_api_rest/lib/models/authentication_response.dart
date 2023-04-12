import 'dart:convert';

class AutheticationResponse {

    final String token;
    final int expiresIn;

    AutheticationResponse({
        required this.token,
        required this.expiresIn,
    });

    

    static AutheticationResponse fromJson(Map<String, dynamic> json) {
      return AutheticationResponse(
        token: json["token"],
        expiresIn: json["expiresIn"],
      ); 
    }
}