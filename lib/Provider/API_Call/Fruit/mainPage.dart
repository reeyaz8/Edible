import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class FruitRecommendation with ChangeNotifier {
  Dio dio = new Dio();
  bool _hasData = false;
  List<dynamic> _recommenddata = [];
  List<dynamic> get recommenddata => _recommenddata;
  List<dynamic> _saledata = [];
  List<dynamic> get saledata => _saledata;
  bool get hasData => _hasData;

  int _isImageDataComplete = 0;
  int get isImageDataComplete => _isImageDataComplete;

  retrieveRecommendationData() async {
    _isImageDataComplete = 0;
    Response response;
    response = await dio.get('http://192.168.254.8:3000/edible/fruit/mainItem');
    if (response.statusCode == 200) {
      Map<String, dynamic> collection = json.decode(response.data);

      _recommenddata = collection["recommend"];
      _saledata = collection["hotsale"];
      _hasData = true;
      notifyListeners();
    }
  }
}
