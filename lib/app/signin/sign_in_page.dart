import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/signin/email_sign_in_page.dart';
import 'package:time_tracker/app/signin/sign_in_button.dart';
import 'package:time_tracker/app/signin/social_sign_in_button.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatelessWidget {
  // SignInPage({
  //   @required this.auth,
  //   // @required this.onSignIn,
  // });

  // final Function(User) onSignIn;
  // final AuthBase auth;

  Future<void> _signInAnonymously(BuildContext context) async {
    final AuthBase auth = Provider.of<AuthBase>(context);
    try {
      await auth.signInAnonymously();
      // final user = await auth.signInAnonymously();
      // print('sign_in page');
      // print('${user.uid}');
      // onSignIn(user);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final AuthBase auth = Provider.of<AuthBase>(context);
    try {
      await auth.signInwithGoogle();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    final AuthBase auth = Provider.of<AuthBase>(context);
    try {
      await auth.signInwithFacebook();
    } on Exception catch (e) {
      print(e);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
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
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(
            height: 10.0,
          ),
          SocialSignInButton(
            text: "Sign in with facebook",
            asset: 'assets/facebook-logo.png',
            backgroundColor: Color(0xFF334D92),
            textColor: Colors.white,
            onPressed: () => _signInWithFacebook(context),
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButton(
            text: "Sign in with email",
            backgroundColor: Colors.teal[700],
            textColor: Colors.white,
            onPressed: () => _signInWithEmail(context),
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
            onPressed: () => _signInAnonymously(context),
          )
        ],
      ),
    );
  }
}
