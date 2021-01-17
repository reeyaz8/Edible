import 'dart:io';

import 'package:Edible/constants.dart';

class CheckUser {
 HttpClient client = HttpClient();

  checkUser(String phone) async {
    HttpClientRequest request = await client.getUrl(Uri.parse(baseURL +'/edible/checker?phone='+phone));
    request.contentLength = -1;

    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}