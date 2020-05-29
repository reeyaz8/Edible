import 'package:Edible/Provider/Data/allFruit.dart';
import 'package:Edible/Provider/Data/mainPage.dart';
import 'package:Edible/Provider/Data/overhead.dart';
import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FruitRecommendation()),
        ChangeNotifierProvider(create: (_) => AllFruitData()),
        ChangeNotifierProvider(create: (_) => FruitOverhead()),
      ],
      child: MaterialApp(
      title: 'Edible',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
        ),
    );
  }
}