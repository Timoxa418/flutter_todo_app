import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home.dart';
import 'package:flutter_application_3/pages/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/todo': (context) => Home(),
      },
    );
  }
}
