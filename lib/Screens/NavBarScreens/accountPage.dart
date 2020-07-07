import 'package:Edible/Provider/Data/accountData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AccountInfo>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.blue])
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('images/profile.png')
            ),
            SizedBox(height: 15.0),
             Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            Text('Name', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300)),
                            SizedBox(height:8.0),
                            Text('Gender', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300)),
                            SizedBox(height:8.0),
                            Text('Phone Number', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300)),
                            SizedBox(height:8.0),
                          ],
                          )
                          )
                      ),
                       Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            Text(data.name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                            SizedBox(height:8.0),
                            Text(data.gender, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                            SizedBox(height:8.0),
                            Text(data.phone, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                            SizedBox(height:8.0),
                          ],
                          )
                          )
                      ),
                    ],),
                    SizedBox(height: 30.0),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: OutlineButton(onPressed: (){

                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue),
                    child: Text('Change Password'),
                    ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: OutlineButton(onPressed: (){

                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.red),
                    child: Text('Log Out'),
                    ),
                    ),
          ],
        ),
      )
    );
  }
}