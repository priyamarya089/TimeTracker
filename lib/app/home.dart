import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  // HomePage({
  //   @required this.auth,
  //   // @required this.onSignOut,
  // });

  // final VoidCallback onSignOut;
  // final AuthBase auth;

  Future<void> _signOut(BuildContext context) async {
    final AuthBase auth = Provider.of<AuthBase>(context);
    try {
      await auth.signOut();
      // print('home page');
      // onSignOut();
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          FlatButton(
            child: Text(
              "LogOut",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            onPressed: () => _signOut(context),
          )
        ],
      ),
    );
  }
}
