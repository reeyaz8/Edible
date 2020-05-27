import 'dart:io';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
File f;
  @override
  Widget build(BuildContext context) {
    File f = File('/data/data/com.example.Edible/app_flutter/apple');
    return Scaffold(
      body: Image.file(f)
    );
  }
}