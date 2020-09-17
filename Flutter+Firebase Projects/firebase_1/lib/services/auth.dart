import 'package:firebase_1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;


  User _userFromFirebaseUser(FirebaseUser user) {
    return user!=null?User(uid: user.uid):null;
  }


  // sign-in anonymously

  Future signInAnon() async {
    try {
     AuthResult result= await _auth.signInAnonymously();
     FirebaseUser user=result.user;
     return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
}

  //sign-in with e-mail

  // register with e-mail and password

  // sign out


}