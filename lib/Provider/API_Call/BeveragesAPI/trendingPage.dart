import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class BeverageRecommendation with ChangeNotifier {
  Dio dio = new Dio();
  bool _hasData = false;
  List<dynamic> _recommenddata = [];
  List<dynamic> get recommenddata => _recommenddata;
  // List<dynamic> _saledata = [];
  // List<dynamic> get saledata => _saledata;
  bool get hasData => _hasData;

  // int _isImageDataComplete = 0;
  // int get isImageDataComplete => _isImageDataComplete;

  retrieveRecommendationData() async {
    Response response;
    response = await dio.get(baseURL + '/edible/beverages/mainItem');
    
    if (response.statusCode == 200) {
      Map<String, dynamic> collection = json.decode(response.data);

      _recommenddata = collection["recommend"];
      _hasData = true;
      notifyListeners();
    }
  }
}
