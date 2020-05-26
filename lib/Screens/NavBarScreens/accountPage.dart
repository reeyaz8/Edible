import 'dart:io';
import 'package:Edible/Provider/Recommender/recommenderImage.dart';
import 'package:Edible/Provider/Recommender/recommenderOverhead.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
File f;
  @override
  Widget build(BuildContext context) {
    File f = File('/data/data/com.example.Edible/app_flutter/apple');
    // final data = FruitData();
    // data.recommendedFruit().then((value) => print('vdfdfbd'+value.data['h1']));
  // final e = ImageRetriever().imageRetriever();
  // ImageRetriever().read().then((value) {
  // f = value;
  //  print(f);
  // }
  // );
  final ee =  Overheadrecommendation().fruitOverheadRetriever();
  
  final data = ImageRecommendation().fruitRecommendedData();
  
  // print(data);
    return Scaffold(
      body: Image.file(f)
    );
  }
}