import 'package:Edible/Provider/LoginService/phoneLoginService.dart';
import 'package:Edible/Provider/LoginService/registerProvider.dart';
import 'package:Edible/Screens/registerScreens/otpVerification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController _countrycodecontroller = TextEditingController(text: '+977');
  TextEditingController _mobilenumbercontroller = TextEditingController();
  TextEditingController _fullnamecontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(
              child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                 Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  child:  IconButton(icon: Icon(Icons.close, color: Colors.blue,), onPressed: (){
                    Navigator.pop(context);
                  })
                ),
                Container(
                  child: Text('Registration', style: TextStyle(fontSize: 25.0),),
                  ),
                Container(
                  child: Text('Your mobile number will be your edible account ID.', maxLines: 2,),
                ),
                SizedBox(height: 30.0),
                Container(
                  child: Text('Mobile Number'),
                ),
                SizedBox(height: 5.0),
                Container(
                  child:
                  Row(
                    children: <Widget>[
                      Container(
                        width: 75.0,
                        child: TextField(
                          controller: _countrycodecontroller,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                            )
                          ),
                        ),
                      ),
                      SizedBox(width:5.0),
                      Container(
                        width: MediaQuery.of(context).size.width - 120,
                        child: Focus(
                          onFocusChange: (bool status){
                            if(status == false){
                                registerProvider.getMobileNumber(_mobilenumbercontroller.text.trim());
                            }
                          },
                            child: TextFormField(
                            controller: _mobilenumbercontroller,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                              ),
                            ),
                ),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(height: 5.0),
                  Container(
                    margin: EdgeInsets.only(left:10.0),
                    child:registerProvider.isMobileInvalid == true ? Text('Invalid Mobile Number', style: TextStyle(color: Colors.red, fontSize:12.0),):null ),
                SizedBox(height:20.0),
            Container(
                  child: Text('Full Name'),
                ),
                SizedBox(height: 5.0),
                Container(
                  child:
                  Focus(
                      onFocusChange: (bool status){
                        if (status == false){
                          registerProvider.getFullName(_fullnamecontroller.text.trim());
                        }
                      },
                      child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _fullnamecontroller,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        errorText: registerProvider.invalidFullName == true ? 'Please Enter a Valid Name':null
                      ),
                      
                ),
                  )),
                SizedBox(height:20.0),
                Container(
                  child: Text('Select Gender'),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Checkbox(value: registerProvider.selectedGender == 0 ? true:false, 
                            onChanged: (bool selected){
                            if (selected == true){
                              registerProvider.changeGender(0);
                            }
                        }),
                        Text('Male')
                      ],),
                      Row(children: <Widget>[
                        Checkbox(value: registerProvider.selectedGender == 1 ? true:false, 
                           onChanged: (bool selected){
                            if (selected == true){
                              registerProvider.changeGender(1);
                            }
                        }),
                        Text('Female')
                      ],),
                      Row(children: <Widget>[
                        Checkbox(value: registerProvider.selectedGender == 2 ? true:false, 
                          onChanged: (bool selected){
                            if (selected == true){
                              registerProvider.changeGender(2);
                            }
                        }),
                        Text('Other')
                      ],)
                  ],)
                  ),
                SizedBox(height:20.0),
                Container(
                  child: Row(children: <Widget>[
                    Container(child: Checkbox(
                      value: registerProvider.conditionaccepted == true ? true:false, 
                      onChanged: (bool status){
                          if(status == true){
                            registerProvider.changeConditionStatus(true);
                          }
                          if(status == false){
                            registerProvider.changeConditionStatus(false);
                          }
                    }),),
                    Expanded(child: Text('I accept Terms and Conditions & Privacy Policy.'))
                  ],)
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
                      registerProvider.updateCountryCode(_countrycodecontroller.text.trim());
                      registerProvider.getFullName(_fullnamecontroller.text.trim());
                      registerProvider.getMobileNumber(_mobilenumbercontroller.text.trim());
                      if(registerProvider.hasgenderselected == true && registerProvider.conditionaccepted == true && registerProvider.invalidFullName == false && registerProvider.isMobileInvalid == false){
                          PhoneSignClass().signInwithPhone(context, _countrycodecontroller.text+_mobilenumbercontroller.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerification(phonenumber : _countrycodecontroller.text.trim()+'-'+_mobilenumbercontroller.text.trim())));
                      }
                      }, child: Text('Proceed', style: TextStyle(color: Colors.white),),),),
                  SizedBox(height: 15.0,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: FlatButton(onPressed: (){
                         Navigator.pop(context);
                    }, child: Text('Go back', style: TextStyle(color: Colors.blue),))
                  )
            ]),
          ),
        ),
      ),
    );
  }
}