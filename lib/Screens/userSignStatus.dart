import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInStatus extends StatefulWidget {
  @override
  _SignInStatusState createState() => _SignInStatusState();
}

class _SignInStatusState extends State<SignInStatus> {
  @override
  void initState() {
  FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.currentUser().then((user){
        if (user != null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BlankScreen()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
        }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}