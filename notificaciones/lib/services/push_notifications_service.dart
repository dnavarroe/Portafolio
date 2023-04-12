

//  SHA1 10:7F:92:A0:FC:D9:EF:A6:72:3F:FC:9C:23:B1:D2:94:B2:86:57:C4

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStreamController = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async{
    //print('onBackground Handler${message.messageId}');

    _messageStreamController.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async{
    //print('onMessage Handler${message.messageId}');

    _messageStreamController.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async{
    //print('onMessage OpenApp${message.messageId}');

    _messageStreamController.add(message.data['producto'] ?? 'No data');
  }

  static Future initializeApp() async{


    //push Notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);


    //Local Notification
  }

  static closeStream(){
    _messageStreamController.close();
  }

}