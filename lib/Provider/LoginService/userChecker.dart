import 'dart:io';

class CheckUser {
 HttpClient client = HttpClient();

  checkUser(String phone) async {
    HttpClientRequest request = await client.getUrl(Uri.parse('http://192.168.254.8:3000/edible/checker?phone='+phone));
    request.contentLength = -1;

    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}