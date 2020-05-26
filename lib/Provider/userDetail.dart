import 'package:firebase_auth/firebase_auth.dart';

 name() async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  print(user.displayName);

  }