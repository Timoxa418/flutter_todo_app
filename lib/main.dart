import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home.dart';
import 'package:flutter_application_3/pages/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() =>  runApp(MaterialApp(
		theme: ThemeData(
			primaryColor: Colors.deepOrangeAccent,
		),
		initialRoute: '/',
		routes: {
			// Маршрутизация
			'/': (context) => MainScreen(),
			'/todo': (context) => Home(),
		},
	));
