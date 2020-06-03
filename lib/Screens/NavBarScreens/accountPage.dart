import 'dart:io';
import 'package:Edible/Provider/Data/accountData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AccountInfo>(context);
    return Scaffold(
      body: Center(
        child: Container(
        margin: EdgeInsets.all(20.0),
          child: Column(children:<Widget>[
            SizedBox(height: 15.0,),
                    Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border : Border.all(
                  width:2.0,
                  color: Colors.blue
                )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('images/logo.png'),
                  ),
                  SizedBox(height:20.0),
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(children: <Widget>[
                          Text('Name'),
                          SizedBox(height:8.0),
                          Text('Gender'),
                          SizedBox(height:8.0),
                          Text('Phone Number'),
                          SizedBox(height:8.0),
                        ],
                        )
                        )
                    ),
                     Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(children: <Widget>[
                          Text(data.name),
                          SizedBox(height:8.0),
                          Text(data.gender),
                          SizedBox(height:8.0),
                          Text(data.phone),
                          SizedBox(height:8.0),
                        ],
                        )
                        )
                    ),
                  ],
                  ),
                ],
              ),
            ), 
      ]),
        ),)
    );
  }
}