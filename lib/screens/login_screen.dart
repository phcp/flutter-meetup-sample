import 'package:flutter/material.dart';
import 'package:meetup_sample/actions/login_actions.dart';
import 'package:meetup_sample/widgets/custom_button.dart';
import 'package:meetup_sample/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {

  static const String route = '/login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        body: new SingleChildScrollView(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 50.0),
              _buildLogo(),
              new SizedBox(height: 30.0),
              new CustomTextField(
                  label: 'E-mail',
                  controller: _emailController,
                  inputType: TextInputType.emailAddress
              ),
              new CustomTextField(
                  label: 'Password',
                  controller: _passwordController,
                  isPassword: true
              ),
              new SizedBox(height: 10.0),
              new CustomButton(
                text: 'Login',
                onPressed: () => _onLoginButtonClick(context),
              ),
            ],
          ),
        ),
        key: _scaffoldKey,
      ),
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
    final snackBar = new SnackBar(
      content: new Text(error),
      backgroundColor: Colors.redAccent,
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}