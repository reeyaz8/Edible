import 'package:Edible/Provider/Data/allFruit.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Provider/Data/mainPage.dart';
import 'package:Edible/Provider/Data/overhead.dart';
import 'package:Edible/Provider/Data/search.dart';
import 'package:Edible/Provider/LoginService/loginProvider.dart';
import 'package:Edible/Provider/LoginService/registerProvider.dart';
import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/loginPage.dart';
import 'package:Edible/Screens/registerScreens/otpVerification.dart';
import 'package:Edible/Screens/registerScreens/passwordSetup.dart';
import 'package:Edible/Screens/registerScreens/registerPage.dart';
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
        ChangeNotifierProvider(create: (_) => Search()),
        ChangeNotifierProvider(create: (_) => CartData()),
        ChangeNotifierProvider(create: (_) => CartPageData()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),

      ],
      child: MaterialApp(
      title: 'Edible',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PasswordSetup()
        ),
    );
  }
}