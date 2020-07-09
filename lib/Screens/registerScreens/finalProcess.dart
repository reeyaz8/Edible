import 'package:Edible/Provider/LoginService/dbConnector.dart';
import 'package:Edible/Provider/LoginService/registerProvider.dart';
import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class FinalProcess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allregisterdata = Provider.of<RegisterProvider>(context);
    final finalconfirmationrequest = Provider.of<UserEntryDB>(context);
    return Scaffold(
      body: SafeArea(child: 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          SizedBox(height:30.0),
          Container(
            alignment: Alignment.center,
            child: Text('Welcome to Edible', style: TextStyle(fontSize:20.0),),),
          Container(
            alignment: Alignment.center,
            child: Text("One final setup and we're done", style: TextStyle(fontWeight: FontWeight.w300),)),
          SizedBox(height:20.0),
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
                        Text('Password'),
                        SizedBox(height:8.0),
                        Text('Country Code')
                      ],
                      )
                      )
                  ),
                   Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(children: <Widget>[
                        Text(allregisterdata.name),
                        SizedBox(height:8.0),
                        allregisterdata.gender == "0" ? Text("Male"):Text("Female"),
                        SizedBox(height:8.0),
                        Text(allregisterdata.mobile),
                        SizedBox(height:8.0),
                        Text(allregisterdata.password),
                        SizedBox(height: 8.0),
                        Text(allregisterdata.ccode)
                      ],
                      )
                      )
                  ),
                ],
                ),
              ],
            ),
          ),         
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: OutlineButton(onPressed: (){
              Toast.show('Please wait...', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              finalconfirmationrequest.sendDatatoDB(context ,allregisterdata.name, allregisterdata.gender, allregisterdata.mobile, allregisterdata.ccode, allregisterdata.password);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            borderSide: BorderSide(color: Colors.blue, width:2.0),
            child: Text('Confirm my Account'))
          ),
           Container(
            width: MediaQuery.of(context).size.width,
            child: OutlineButton(onPressed: (){
              showDialog(context: context,
                builder: (context){
                 return AlertDialog(
                    titlePadding: EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    title: Text('Cancel', textAlign: TextAlign.center ,style: TextStyle(fontSize:18.0),),
                    content: Text('All your progress will be lost. Do you want to cancel the process?'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    actions: <Widget>[
                      FlatButton(onPressed: (){
                          Navigator.pop(context);
                      }, child: Text('Cancel', style: TextStyle(color: Colors.red),),),
                      FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
                      }, child: Text('Confirm'))
                    ],
                  );
                },
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            borderSide: BorderSide(color: Colors.red, width:2.0),
            child: Text('Cancel'))
          ),
        ],
        ),
        )
      ),
    );
  }
}