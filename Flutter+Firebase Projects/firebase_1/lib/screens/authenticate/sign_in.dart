import 'package:firebase_1/models/user.dart';
import 'package:firebase_1/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Brew Server"),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: RaisedButton(
          child: Text("Sign-In Anon"),
          onPressed: () async{
            dynamic result = await  _auth.signInAnon();
            if(result==null) {
              print("Error Signing In");
            }
            else {
              print("User Signed In");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
