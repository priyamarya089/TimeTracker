import 'package:flutter/cupertino.dart';
import 'package:time_tracker/common_widgets/custom_button.dart';

class SocialSignInButton extends CustomButton {
  SocialSignInButton({
    @required String text,
    @required String asset,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(asset),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: textColor,
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Image.asset(asset),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          onPressed: onPressed,
        );
}
