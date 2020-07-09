import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInStatus extends StatefulWidget {
  @override
  _SignInStatusState createState() => _SignInStatusState();
}

class _SignInStatusState extends State<SignInStatus> {
  @override
  void initState() {

    SharedPreferences.getInstance().then((preferences) {
      if(preferences.getString('name') != null && preferences.getString('phone') != null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
      }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}