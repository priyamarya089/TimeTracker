import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/home.dart';
import 'package:time_tracker/app/signin/sign_in_page.dart';
import 'package:time_tracker/services/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({
    @required this.auth,
  });
  AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    var user = widget.auth.currentUser();
    // print('$user');
    updateUser(user);
  }

  void updateUser(User user) {
    // print("landing page");
    // print('${user.uid}');
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null)
      return SignInPage(
        auth: widget.auth,
        onSignIn: (_user) => updateUser(_user),
      );
    return HomePage(
      auth: widget.auth,
      onSignOut: () => updateUser(null),
    );
  }
}
