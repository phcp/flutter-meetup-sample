import 'package:flutter/material.dart';
import 'package:meetup_sample/screens/home_screen.dart';
import 'package:meetup_sample/screens/login_screen.dart';

void main() => runApp(new MeetupApp());

class MeetupApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Liferay Meetup',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeScreen(),
      routes: <String, WidgetBuilder> { //5
        HomeScreen.route: (BuildContext context) => new HomeScreen(),
        LoginScreen.route : (BuildContext context) => new LoginScreen(),
      },
    );
  }

}
