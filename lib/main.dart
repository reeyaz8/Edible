import 'package:Edible/Provider/API_Call/Fruit/allFruit.dart';
import 'package:Edible/Provider/Data/accountData.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Provider/API_Call/Fruit/mainPage.dart';
import 'package:Edible/Provider/Data/navRailIndex.dart';
import 'package:Edible/Provider/API_Call/Fruit/overhead.dart';
import 'package:Edible/Provider/API_Call/Fruit/search.dart';
import 'package:Edible/Provider/LoginService/dbConnector.dart';
import 'package:Edible/Provider/LoginService/login.dart';
import 'package:Edible/Provider/LoginService/loginProvider.dart';
import 'package:Edible/Provider/LoginService/phoneLoginService.dart';
import 'package:Edible/Provider/LoginService/registerProvider.dart';
import 'package:Edible/Provider/pathProvider/path.dart';
import 'package:Edible/Screens/userSignStatus.dart';
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
        ChangeNotifierProvider(create: (_) => Login()),
        ChangeNotifierProvider(create: (_) => PathProvider()),
        ChangeNotifierProvider(create: (_) => NavRailIndex()),
        ChangeNotifierProvider(create: (_) => FruitRecommendation()),
        ChangeNotifierProvider(create: (_) => AllFruitData()),
        ChangeNotifierProvider(create: (_) => FruitOverhead()),
        ChangeNotifierProvider(create: (_) => Search()),
        ChangeNotifierProvider(create: (_) => CartData()),
        ChangeNotifierProvider(create: (_) => AccountInfo()),
        ChangeNotifierProvider(create: (_) => CartPageData()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => PhoneSignClass()),
        ChangeNotifierProvider(create: (_) => UserEntryDB()),
      ],

      child: MaterialApp(
      title: 'Edible',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInStatus()
      ),
    );
  }
}