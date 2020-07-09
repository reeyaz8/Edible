import 'package:Edible/Screens/loginPage.dart';
import 'package:Edible/Screens/registerScreens/registerPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("images/logo.png"), height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign In',
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.green, width:2.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("images/logo.png"), height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Register',
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
             Text('By using edible, you accept our Terms and Conditions',
             style: TextStyle(fontSize:10.0),),)
          ]
        ),
      ),
    );
  }
}