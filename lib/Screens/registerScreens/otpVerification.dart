import 'package:Edible/Provider/LoginService/phoneLoginService.dart';
import 'package:Edible/Provider/LoginService/registerProvider.dart';
import 'package:Edible/Screens/registerScreens/passwordSetup.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPVerification extends StatelessWidget {
  String phonenumber;
  OTPVerification({this.phonenumber});
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<RegisterProvider>(context);
    final otpverifier = Provider.of<PhoneSignClass>(context);
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:20.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      Container(child: Image.asset('images/logo.png'), width: 40.0, height: 40.0),
                      SizedBox(width:5.0),
                      Container(child: Text('Edible', style: TextStyle(fontSize:35.0, fontFamily:'Cursive'),),),
                    ],
                    )
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.center,
                    child: Container(child: Text('Enter OTP code sent to '+phonenumber+'.', style: TextStyle(fontSize:16.0),),)
                  ),
                  SizedBox(height:20.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Focus(
                      onFocusChange: (bool hasFocus){
                        if(hasFocus ==false){
                          otpProvider.getOTP(_otpController.text.trim());
                        }
                      },
                        child: TextFormField(
                        controller: _otpController,
                        style: TextStyle(height:1.5),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      errorText: otpProvider.isOtpValid == false ? 'OTP must be 6 character long' : null
                  ),
                  textAlign: TextAlign.center,        
                  ),
                    ),),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text('You will recieve your OTP code within one minute', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300))),
                  SizedBox(height:10.0),
                  Container(
                    child: otpverifier.isOTPValid == false ? Container(
                      child: Text('Wrong OTP. Try Again', style: TextStyle(color: Colors.red),)
                    ):null
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    width: MediaQuery.of(context).size.width-70.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      elevation: 0.0,
                      color: Colors.blue,
                      onPressed: (){
                        otpProvider.getOTP(_otpController.text.trim());
                        if (otpProvider.isOtpValid == true){
                          PhoneSignClass().signInManually(context, _otpController.text.trim());
                        }
                        }, child: Text('Proceed', style: TextStyle(color: Colors.white),),),),
                  SizedBox(height: 30.0),
                  Container(
                    width: MediaQuery.of(context).size.width-70.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      elevation: 0.0,
                      color: Colors.red,
                      onPressed: (){
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
                        }, child: Text('Cancel', style: TextStyle(color: Colors.white),),),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}