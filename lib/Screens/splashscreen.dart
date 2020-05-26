import 'dart:async';
import 'package:Edible/Provider/LoginService/googleLoginService.dart';
import 'package:Edible/Provider/LoginService/facebookLoginService.dart';
import 'package:Edible/Screens/NavigationRail.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showContainer = false;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      setState(() {
        showContainer = true;
      });
    });
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Container(
            child: Text('Edible', style: TextStyle(fontSize:35.0, fontFamily:'Cursive'),),
          ),
          SizedBox(height: 20.0,),
          Container(
            child: Image.asset('images/splashscreen.png'),
          ),
          SizedBox(height: 40.0,),
         
          Container(
            width: MediaQuery.of(context).size.width-80.0,
            child: OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Navigation();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    )
          ),
          SizedBox(height:8.0),
          Container(
            width: MediaQuery.of(context).size.width-80.0,
            child: OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
       signInwithFacebook().whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation())));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/facebook_logo.png"), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Facebook',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    )
          ),
          SizedBox(height: 8.0,),
          Container(child:
           Text('By signing in, you accept our Terms and Conditions',
           style: TextStyle(fontSize:10.0),),)
        ]
      ),
    );
  }
}