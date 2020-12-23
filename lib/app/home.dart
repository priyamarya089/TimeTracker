import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              "LogOut",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
