import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  const CustomTextField({
    Key key,
    this.label,
    this.controller,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0)
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isPassword;
  final EdgeInsets padding;

  @override
  State<StatefulWidget> createState() => new _CustomTextFieldState();

}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: widget.padding,
      child: new TextField(
        autofocus: true,
        controller: widget.controller,
        decoration: new InputDecoration(
          labelText: widget.label,
        ),
        obscureText: widget.isPassword,
        keyboardType: widget.inputType,
      ),
    );
  }

}