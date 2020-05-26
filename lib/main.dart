import 'package:Edible/Provider/Recommender/recommenderImage.dart';
import 'package:Edible/Provider/Recommender/recommenderName.dart';
import 'package:Edible/Provider/frontProvider/fruitRecommendation.dart';
import 'package:Edible/Provider/pathProvider/path.dart';
import 'package:Edible/Screens/NavigationRail.dart';
import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  // ImageRecommendation().fruitRecommendedData().whenComplete(() => null);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>ImageRecommendation()),
        ChangeNotifierProvider(create: (_) =>PathProvider()),
      ],
      child: MaterialApp(
      title: 'Edible',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlankScreen()
        ),
    );
  }
}