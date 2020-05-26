import 'dart:io';
import 'package:Edible/Provider/Recommender/recommenderName.dart';
import 'package:Edible/Provider/Recommender/recommenderOverhead.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class ImageRecommendation with ChangeNotifier{

  bool hasFruitRecommendation = false;
  bool hasVegetableRecommendation= false;
  bool hasBakeryRecommendation = false;
  bool hasBeverageRecommendation = false;
  bool get fruitRetrieveComplete => hasFruitRecommendation;
  bool get vegetableRetrieveComplete => hasVegetableRecommendation;
  bool get bakeryRetrieveComplete => hasBakeryRecommendation;
  bool get beverageRetrieveComplete => hasBeverageRecommendation;

  Future<void> fruitRecommendedData() async{
    final directory = await getApplicationDocumentsDirectory();
    NameRecommendation().recommendedFruitName().then((value){
      for (var i = 0; i < value.data['names'].length; i++) {
        if (File(directory.path+'/'+value.data['names'][i]).existsSync()  == true){

        }
        else{
          File imageFile = File(directory.path+'/'+value.data['names'][i]);
          StorageReference storageReference = FirebaseStorage().ref();
          storageReference.child('fruits/'+value.data['names'][i]+'.png').writeToFile(imageFile);
        }
        }
      }
    );
    Overheadrecommendation().fruitOverheadRetriever();
    print(hasFruitRecommendation);
    hasFruitRecommendation = true;
    print(hasFruitRecommendation);
    notifyListeners();
  }

  bakeryRecommendedImages() async{
    final directory = await getApplicationDocumentsDirectory();
    NameRecommendation().recommendedBakeryName().then((value){
      for (var i = 0; i < value.data['names'].length; i++) {
        if (File(directory.path+'/bakery/'+value.data['names'][i]).existsSync()  == true){

        }
        else{
          File imageFile = File(directory.path+'/bakery/'+value.data['names'][i]);
          StorageReference storageReference = FirebaseStorage().ref();
          storageReference.child('bakery/'+value.data['names'][i]+'.png').writeToFile(imageFile);
        }
        }
      }
    );
  }

  beverageRecommendedImages() async{
    final directory = await getApplicationDocumentsDirectory();
    NameRecommendation().recommendedBeverageName().then((value){
      for (var i = 0; i < value.data['names'].length; i++) {
        if (File(directory.path+'/beverages/'+value.data['names'][i]).existsSync()  == true){

        }
        else{
          File imageFile = File(directory.path+'/beverages/'+value.data['names'][i]);
          StorageReference storageReference = FirebaseStorage().ref();
          storageReference.child('beverage/'+value.data['names'][i]+'.png').writeToFile(imageFile);
        }
        }
      }
    );
  }

  vegetableRecommendedImages() async{
    final directory = await getApplicationDocumentsDirectory();
    NameRecommendation().recommendedVegetableName().then((value){
      for (var i = 0; i < value.data['names'].length; i++) {
        if (File(directory.path+'/vegetable/'+value.data['names'][i]).existsSync()  == true){

        }
        else{
          File imageFile = File(directory.path+'/vegetables/'+value.data['names'][i]);
          StorageReference storageReference = FirebaseStorage().ref();
          storageReference.child('vegetable/'+value.data['names'][i]+'.png').writeToFile(imageFile);
        }
        }
      }
    );
  }
}