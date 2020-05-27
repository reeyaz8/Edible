import 'dart:async';

import 'package:Edible/Provider/pathProvider/path.dart';
import 'package:Edible/Screens/NavigationRail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlankScreen extends StatefulWidget {
  
  @override
  _BlankScreenState createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {

  // @override
  // void initState() {
  //   getRecommendationNameOnly();
  //   super.initState();
  // }

  // getRecommendationNameOnly() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   Future<DocumentSnapshot> data = Firestore.instance.collection('main').document('fruit').get();
  //   data.then((value) {
  //       List<String> _list1 = List<String>.from(value.data['recommend']);
  //       List<String> _list2 = List<String>.from(value.data['sale']);
  //       preferences.setStringList('fruitRecommendation', _list1);
  //       preferences.setStringList('fruitSale', _list2);
  //       NameRecommendation().recommendedFruitName().whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation())));
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height:10.0),
            Text('Looking for new recommendation...'),
        ],
        )
      ),
    );
  }
}