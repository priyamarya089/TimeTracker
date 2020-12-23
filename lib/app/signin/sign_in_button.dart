import 'package:flutter/cupertino.dart';
import 'package:time_tracker/common_widgets/custom_button.dart';

class SignInButton extends CustomButton {
  SignInButton({
    @required String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              color: textColor,
            ),
          ),
          backgroundColor: backgroundColor,
          onPressed: onPressed,
        );
}
