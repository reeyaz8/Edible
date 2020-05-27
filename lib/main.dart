import 'package:Edible/Provider/pathProvider/path.dart';
import 'package:Edible/Screens/NavigationRail.dart';
import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Edible',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
    home: Navigation()
      );
  }
}