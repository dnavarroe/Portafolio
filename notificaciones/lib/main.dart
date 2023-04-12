import 'package:flutter/material.dart';
import 'package:notificaciones/screens/screens.dart';
import 'package:notificaciones/services/push_notifications_service.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    
    super.initState();

    PushNotificationService.messageStream.listen((message) { 

      print('Myapp: $message');

      navigatorKey.currentState?.pushNamed(MesageScreen.routename, arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routename,
      navigatorKey: navigatorKey, //Navegar
      scaffoldMessengerKey: messengerKey, //Mostrar snacks
      routes: {
        HomeScreen.routename: (_) => const HomeScreen(),
        MesageScreen.routename: (_) => const MesageScreen()
      },
      
    );
  }
}