import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
FacebookLogin facebookSignIn = new FacebookLogin();
FirebaseUser currentUser;

Future<FirebaseUser> signInwithFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: accessToken.token);  
        final AuthResult userAuth = await auth.signInWithCredential(credential); 
        final FirebaseUser user = userAuth.user;
        print(user.isEmailVerified);
        print(user.displayName);
        print(user.email);
        print(user.phoneNumber);
        assert(user.email != null);
        assert(user.displayName != null);
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        currentUser = await auth.currentUser();
        assert(user.uid == currentUser.uid);
        
        return currentUser;
        break;

      case FacebookLoginStatus.cancelledByUser:
        break;

      case FacebookLoginStatus.error:
        break;
    }
  }

  Future<bool> signOutFacebook() async {
    await auth.signOut();
    await facebookSignIn.logOut();
    return true;
  }
