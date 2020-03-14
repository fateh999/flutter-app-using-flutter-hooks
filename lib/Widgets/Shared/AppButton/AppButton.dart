import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppButton extends HookWidget {
  final child;
  final onPressed;
  final color;
  final textColor;
  final loading;

  AppButton(
      {@required this.onPressed,
      this.child,
      this.color,
      this.textColor,
      this.loading});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: loading == true
          ? Row(children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                height: 28,
                width: 28,
              ),
              SizedBox(width: 20),
              child,
            ], mainAxisAlignment: MainAxisAlignment.center)
          : child,
      color: color,
      textColor: textColor,
    );
  }
}
