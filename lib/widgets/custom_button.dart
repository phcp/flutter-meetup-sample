import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    Key key,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.text,
    @required this.onPressed,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
      child: new Text(text),
      onPressed: onPressed,
      color: this.color,
      textColor: this.textColor,
    );
  }

}
