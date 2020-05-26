import 'package:Edible/Provider/Recommender/recommenderName.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Overheadrecommendation {

  fruitOverheadRetriever() async {
    List<String> _list = [];
    NameRecommendation().recommendedFruitName();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> recommendedFruitList = preferences.getStringList('fruitRecommendation');

    for (var i = 0; i < recommendedFruitList.length; i++) {
        Future<QuerySnapshot> data = Firestore.instance.collection('fruit').document(recommendedFruitList[i]).collection('overhead').getDocuments();
        data.then((value) {
          String documentId = value.documents[0].documentID;
          Future<DocumentSnapshot> data = Firestore.instance.collection('fruit').document(recommendedFruitList[i]).collection('overhead').document(documentId).get();
          data.then((value){
            _list.add(value.data['fullName']);
            _list.add(value.data['price']);
            _list.add(value.data['rating']);     
            preferences.setStringList(recommendedFruitList[i], _list);  
            _list = [];     
          });
        });
    }
  }
}