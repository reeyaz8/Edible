import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInfo with ChangeNotifier{

  String _name = '';
  String get name => _name;

    String _phone = '';
  String get phone => _phone;

    String _gender = '';
  String get gender => _gender;

  loadAccountData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _name = preferences.getString('name');
    _gender = preferences.getString('gender');
    _phone = preferences.getString('phone');
  }
}