import 'package:Edible/Provider/LoginService/dbConnector.dart';
import 'package:Edible/Provider/LoginService/registerProvider.dart';
import 'package:Edible/Screens/blankScreen.dart';
import 'package:Edible/Screens/registerScreens/finalProcess.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class PasswordSetup extends StatelessWidget {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final passwordProvider = Provider.of<RegisterProvider>(context);
    final dbConnector = Provider.of<UserEntryDB>(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(icon: Icon(Icons.close, color: Colors.blue), onPressed: (){
                      showDialog(
                                context: context,
                                builder: (context) {
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
                    })
                  ),
                    Container(
                    child: Row(
                      children: <Widget>[
                      Container(child: Image.asset('images/logo.png'), width: 40.0, height: 40.0),
                      SizedBox(width:5.0),
                      Container(child: Text('Edible', style: TextStyle(fontSize:35.0, fontFamily:'Cursive'),),),
                    ],
                    )
                  ),
                  SizedBox(height: 30.0),
                    Container(
                      child: Text('Password Setup', style: TextStyle(fontSize: 22.0),),
                    ),
                    Container(
                      child: Text('Set your password to login for next time.', style: TextStyle(fontSize: 12.0),),
                    ),
                    SizedBox(height:20.0),
                     Container(
                    child: Text('Enter new Password'),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child:
                    Focus(
                      onFocusChange: (bool hasFocus){
                        if (hasFocus == false){
                            passwordProvider.getUpdatedPassword(_passwordController.text.trim());
                        }
                      },
                        child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          errorText: passwordProvider.ispasswordValid == false ? 'Password must be 4 characters long' : null
                        ),
                  ),
                    )),
                   SizedBox(height:20.0),
                     Container(
                    child: Text('Confirm new Password'),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child:
                    Focus(
                      onFocusChange: (bool hasFocus){
                        if(hasFocus == false){
                          passwordProvider.getConfirmPassword(_passwordController.text.trim(), _confirmpasswordController.text.trim());
                        }
                      },
                        child: TextFormField(
                        controller: _confirmpasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          errorText: passwordProvider.isconfirmpasswordValid == false ? "Password don't match" : null
                        ),
                  ),
                    )),
                  SizedBox(height: 25.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      elevation: 0.0,
                      color: Colors.blue,
                      onPressed: (){
                          passwordProvider.getUpdatedPassword(_passwordController.text.trim());
                          passwordProvider.getConfirmPassword(_passwordController.text.trim(), _confirmpasswordController.text.trim());
                          if (passwordProvider.ispasswordValid == true && passwordProvider.isconfirmpasswordValid == true){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FinalProcess()));
                          }
                        }, child: Text('Confirm Password', style: TextStyle(color: Colors.white),),),),
              ],),
            )
          ),
        ),
        
      ),
    );
  }
}