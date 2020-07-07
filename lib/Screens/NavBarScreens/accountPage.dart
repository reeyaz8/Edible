import 'dart:io';
import 'package:Edible/Provider/Data/accountData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AccountInfo>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            
          ),
        ],
      )
    );
  }
}