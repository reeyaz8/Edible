import 'package:Edible/Provider/LoginService/loginProvider.dart';
import 'package:Edible/Provider/LoginService/phoneLoginService.dart';
import 'package:Edible/Screens/registerScreens/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  child:  IconButton(icon: Icon(Icons.close, color: Colors.blue,), onPressed: (){
                    Navigator.pop(context);
                  })
                ),
                Container(
                  child: Row(children: <Widget>[
                    Container(child: Image.asset('images/logo.png'), width: 40.0, height: 40.0),
                    SizedBox(width:5.0),
                    Container(child: Text('Edible', style: TextStyle(fontSize:35.0, fontFamily:'Cursive'),),),
                  ],)
                ),
                SizedBox(height:40.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Welcome' , style: TextStyle(fontSize:25.0),),),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Sign in to continue', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300))
                ),
                SizedBox(height:20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Focus(
                    onFocusChange: (bool hasFocus){
                      if(hasFocus == false){
                          loginProvider.getMobileNumber(_phonecontroller.text.trim());
                      }
                    },
                      child: TextFormField(
                      controller: _phonecontroller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                         border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        labelText: 'Mobile Number',
                        errorText: loginProvider.isMobileInvalid == true ? 'Invalid Mobile Number':null
                      ),
                    ),
                  ),
                ),
                SizedBox(height:20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Focus(
                      onFocusChange: (bool hasFocus){
                        if(hasFocus == false){
                          loginProvider.getPassword(_passwordcontroller.text.trim());
                        }
                      },
                      child: TextFormField(
                      controller: _passwordcontroller,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        labelText: 'Password',
                        errorText: loginProvider.isPasswordInvalid == true ? 'Password length should be more than 4 characters':null
                      ),
                    ),
                  ),
                ),
                SizedBox(height:20.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Container(
                      child: Row(children: <Widget>[
                        Checkbox(value: true, onChanged: null),
                        Text('Remember me')
                      ],)
                      ),
                      Container(
                        child: FlatButton(
                          child: Text('Forgot Password?', style: TextStyle(color: Colors.blue ,fontSize: 14.0, fontWeight: FontWeight.w400),),
                          onPressed: (){}
                        )
                      )
                  ],
                  )
                ),
                SizedBox(height:20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    elevation: 0.0,
                    color: Colors.blue,
                    onPressed: (){
                      loginProvider.getMobileNumber(_phonecontroller.text.trim());
                      loginProvider.getPassword(_passwordcontroller.text.trim());
                      if (loginProvider.isMobileInvalid == false && loginProvider.isPasswordInvalid == false){
                          print('Login Code Here');
                      }
                      }, child: Text('Login', style: TextStyle(color: Colors.white),),),),
                      SizedBox(height:20.0),
                      Container(
                        child: FlatButton(
                          child: Text('Register for free', style: TextStyle(color: Colors.blue),), onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },)
                      )
                  ],
                ),
          ),
            ),
      )
    );
  }
}