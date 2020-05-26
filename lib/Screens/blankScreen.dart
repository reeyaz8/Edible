import 'package:Edible/Provider/Recommender/recommenderImage.dart';
import 'package:Edible/Provider/pathProvider/path.dart';
import 'package:Edible/Screens/NavigationRail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlankScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    ImageRecommendation().fruitRecommendedData();
    final path = Provider.of<PathProvider>(context);
    path.getPath();
    final changeScreen = Provider.of<ImageRecommendation>(context);

    return Scaffold(
      body: changeScreen.fruitRetrieveComplete == true ? Navigation() : Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          SizedBox(height:10.0),
          Text('Looking for new recommendation...'),
        ],
        )
      ),
      
    );
  }
}