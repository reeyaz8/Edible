import 'package:Edible/Provider/LoginService/changePassword.dart';
import 'package:Edible/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Changepassword extends StatelessWidget {
  final oldpass = TextEditingController();
  final newpass = TextEditingController();
  final confirmpass = TextEditingController();
  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  final FocusNode focus3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<ChangePassword>(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.topRight,
                  child: new IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.blue,
                  )),
              new Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 0.0),
                child: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                ),
              ),
              new Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Create your new Password for login",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: Text(
                        "Current Password",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            width: MediaQuery.of(context).size.width - 90,
                            color: Colors.white,
                            child: Focus(
                              onFocusChange: (hasFocus) {
                                if (hasFocus == false) {
                                  password.validateCurrentPassword(
                                      oldpass.text.trim());
                                } else {}
                              },
                              child: TextFormField(
                                obscureText: password.showCurrentPass == false
                                    ? true
                                    : false,
                                focusNode: focus1,
                                controller: oldpass,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (text) =>
                                    focus2.requestFocus(),
                                style: TextStyle(fontSize: 16.0),
                                decoration: InputDecoration(
                                    errorText: password.currentPasswordValid ==
                                            false
                                        ? 'Password must be more than 4 Characters'
                                        : null,
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.visibility),
                                        onPressed: () {
                                          password.showOldPassText();
                                        })),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        "New Password",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            width: MediaQuery.of(context).size.width - 90,
                            color: Colors.white,
                            child: Focus(
                              onFocusChange: (hasFocus) {
                                if (hasFocus == false) {
                                  password
                                      .validateNewPassword(newpass.text.trim());
                                }
                              },
                              child: TextFormField(
                                obscureText: password.showNewPass == false
                                    ? true
                                    : false,
                                focusNode: focus2,
                                onFieldSubmitted: (text) =>
                                    focus3.requestFocus(),
                                textInputAction: TextInputAction.next,
                                controller: newpass,
                                style: TextStyle(fontSize: 16.0),
                                decoration: InputDecoration(
                                    errorText: password.confirmPasswordValid ==
                                            false
                                        ? 'Password must be more than 4 characters'
                                        : null,
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.visibility),
                                        onPressed: () {
                                          password.showNewPassText();
                                        })),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        "Confirm New Password",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            width: MediaQuery.of(context).size.width - 90,
                            color: Colors.white,
                            child: Focus(
                              onFocusChange: (hasFocus) {
                                if (hasFocus == false) {
                                  password.validateConfirmPassword(
                                      newpass.text.trim(),
                                      confirmpass.text.trim());
                                }
                              },
                              child: TextFormField(
                                obscureText: password.showConfirmPass == false
                                    ? true
                                    : false,
                                focusNode: focus3,
                                onFieldSubmitted: (text) => focus3.unfocus(),
                                controller: confirmpass,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(fontSize: 16.0),
                                decoration: InputDecoration(
                                    errorText:
                                        password.confirmnewPasswordValid ==
                                                false
                                            ? 'Password doesnot match'
                                            : null,
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.visibility),
                                        onPressed: () {
                                          password.showConfirmPassText();
                                        })),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width - 90,
                      child: RaisedButton(
                        disabledColor: Colors.blue,
                        onPressed: () async {
                          focus1.unfocus();
                          focus2.unfocus();
                          focus3.unfocus();
                          password.validateCurrentPassword(oldpass.text.trim());
                          password.validateNewPassword(newpass.text.trim());
                          password.validateConfirmPassword(
                              newpass.text.trim(), confirmpass.text.trim());

                          if (password.currentPasswordValid == true &&
                              password.confirmPasswordValid == true &&
                              password.confirmnewPasswordValid == true) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => AlertDialog(
                                      content: new Container(
                                          child: Row(
                                        children: <Widget>[
                                          new CircularProgressIndicator(
                                            strokeWidth: 3.0,
                                          ),
                                          new Container(
                                              margin:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Text("Please Wait..."))
                                        ],
                                      )),
                                    ));
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            
                            password
                                .changePasswordRequest(
                                    pref.getString('phone'),
                                    oldpass.text.trim(),
                                    confirmpass.text.trim())
                                .then((complete) {
                              if (complete == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));
                                password.dispose();
                              } else {
                                Navigator.pop(context);
                                Toast.show(
                                    'Error changing password. Try again later',
                                    context,
                                    gravity: Toast.BOTTOM,
                                    duration: Toast.LENGTH_LONG);
                              }
                            });
                          }
                        },
                        elevation: 0.0,
                        child:
                            Text("Done", style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
