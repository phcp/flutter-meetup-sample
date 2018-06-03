import 'package:flutter/material.dart';
import 'package:meetup_sample/actions/login_actions.dart';

class LoginScreen extends StatefulWidget {

  static const String route = "/login";

  @override
  _LoginScreenState createState() => new _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController;
  TextEditingController _passwordController;

  bool _hasErrors = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 50.0),
            new Center(
              child: new Text("Liferay Meetup"),
            ),
            new SizedBox(height: 50.0),
            _buildTextField("E-mail", _emailController, inputType: TextInputType.emailAddress),
            _buildTextField("Password", _passwordController, isPassword: true),
            new SizedBox(height: 10.0),
            new MaterialButton(
              child: new Text("Login"),
              onPressed: _onLoginButtonClick,
              color: Colors.teal,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController textController,
      {bool isPassword = false, TextInputType inputType = TextInputType.text}) {

    return new Padding(
      padding: new EdgeInsets.symmetric(vertical: 10.0),
      child: new TextField(
        autofocus: true,
        controller: textController,
        decoration: InputDecoration(
            labelText: label
        ),
        obscureText: isPassword,
        keyboardType: inputType,
        style: TextStyle(
          color: Colors.black,
          decorationColor: _hasErrors ? Colors.redAccent : Colors.black,
          fontSize: 12.0
        ),
      ),
    );
  }

  void _onLoginButtonClick() {
    LoginService.performLogin(_emailController.text, _passwordController.text)
        .then(_loginSuccessful)
        .catchError(_loginFailed);
  }

  void _loginSuccessful(String user) {
    Navigator.pop(context);
  }

  void _loginFailed(Exception exception) {
    setState(() {
      _hasErrors = true;
    });
  }

}