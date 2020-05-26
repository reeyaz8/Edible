import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class PathProvider with ChangeNotifier{

  String _path = '';
  String get fullPath => _path;

  getPath() async{
    Directory directory = await getApplicationDocumentsDirectory();
    _path = directory.path;
  }
}