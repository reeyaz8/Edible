import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRetriver with ChangeNotifier{

  getImagewithID(String id, String category) async {
      Directory directory = await  getApplicationDocumentsDirectory();
      if(Directory(directory.path+'/'+category).existsSync() == false){
          await Directory(directory.path+'/'+category).create();
      }
      if (File(directory.path+'/'+category+'/'+id).existsSync() == false){
        StorageReference storageReference = FirebaseStorage().ref();
        File _file = File(directory.path+'/'+category+'/'+id);
        storageReference.child(category+'/'+id+'.png').writeToFile(_file);
      }
  }
}