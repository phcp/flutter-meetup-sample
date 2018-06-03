
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {

  static final String loggedUserPref = 'loggedUser';

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loggedUserPref)?.isNotEmpty ?? false;
  }

  static Future<String> performLogin(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loggedUserPref, '$login:$password');
    return login;
  }

  static Future performLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loggedUserPref, null);
  }

}