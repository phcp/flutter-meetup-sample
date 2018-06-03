import 'package:flutter/material.dart';
import 'package:meetup_sample/actions/login_actions.dart';

class LoginScreen extends StatefulWidget {

  static const String route = '/login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey _scaffoldKey = new GlobalKey();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 50.0),
            _buildLogo(),
            new SizedBox(height: 30.0),
            _buildTextField('E-mail', _emailController,
                inputType: TextInputType.emailAddress),
            _buildTextField('Password', _passwordController, isPassword: true),
            new SizedBox(height: 10.0),
            _buildMaterialButton(onPressed: () => _onLoginButtonClick(context)),
          ],
        ),
      ),
      key: _scaffoldKey,
    );
  }

  Widget _buildMaterialButton({VoidCallback onPressed}) {
    return new MaterialButton(
      child: new Text("Login"),
      onPressed: onPressed,
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  Widget _buildLogo() {
    return new DecoratedBox(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Image.asset('images/liferay_logo.png', height: 80.0),
      )
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
          labelText: label,
        ),
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }

  void _onLoginButtonClick(BuildContext context) async {
    try {
      var user = await LoginActions.performLogin(
          _emailController.text, _passwordController.text);
      _loginSuccessful(user);
    }
    catch(ex) {
      _loginFailed(context, ex);
    }
  }

  void _loginSuccessful(String user) {
    Navigator.pop(context);
  }

  void _loginFailed(BuildContext context, String error) {
    if(_scaffoldKey.currentState is ScaffoldState) {
      final snackBar = new SnackBar(
        content: new Text(error),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldState scaffoldState = _scaffoldKey.currentState;

      scaffoldState.showSnackBar(snackBar);
    }
  }

}