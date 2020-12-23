import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.child,
    this.backgroundColor: Colors.white,
    this.borderColor: Colors.black,
    this.borderRadius: 5.0,
    this.onPressed,
  });
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
          child: Center(child: child),
          height: 50.0,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
