import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/signin/sign_in_button.dart';
import 'package:time_tracker/app/signin/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.onSignIn});
  final Function(User) onSignIn;
  Future<void> _signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      // print('sign_in page');
      print('${authResult.user.uid}');
      onSignIn(authResult.user);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100.0,
          ),
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          SocialSignInButton(
            text: "Sign in with google",
            asset: 'assets/google-logo.png',
            textColor: Colors.black,
          ),
          SizedBox(
            height: 10.0,
          ),
          SocialSignInButton(
            text: "Sign in with facebook",
            asset: 'assets/facebook-logo.png',
            backgroundColor: Color(0xFF334D92),
            textColor: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButton(
            text: "Sign in with email",
            backgroundColor: Colors.teal[700],
            textColor: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "or",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButton(
            text: "Sign in anonymous",
            backgroundColor: Colors.lime[300],
            textColor: Colors.black,
            onPressed: _signInAnonymously,
          )
        ],
      ),
    );
  }
}
