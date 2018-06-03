
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LoginActions {

  static final String loggedUserPref = 'loggedUser';

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loggedUserPref)?.isNotEmpty ?? false;
  }

  static Future<String> performLogin(String email, String password) async {
    if(email.isEmpty || password.isEmpty) {
      throw 'E-mail and password are required.';
    }

    String loggedUser = '$email:$password';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loggedUserPref, loggedUser);

    return loggedUser;
  }

  static Future performLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loggedUserPref, null);
  }

}