import 'dart:async';
import 'package:Edible/Provider/Data/mainPage.dart';
import 'package:Edible/Screens/NavigationRail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlankScreen extends StatefulWidget {

  @override
  _BlankScreenState createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<FruitRecommendation>(context, listen: false);
    mainData.retrieveRecommendationData();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Navigation()));
    });
    return WillPopScope(
        onWillPop: () async => false,
          child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
              SizedBox(height:10.0),
              Text('Looking for new recommendation...'),
          ]
          )
        )
      ),
    );
  }
}