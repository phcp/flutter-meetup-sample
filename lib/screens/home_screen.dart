import 'package:flutter/material.dart';
import 'package:meetup_sample/actions//login_actions.dart';
import 'package:meetup_sample/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key}) : super(key: key);

  static const String route = "/home";
  final String title = "Liferay Meetup";

  @override
  _HomeScreenState createState() => new _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    _redirectToLoginIfNeeded();
  }

  void _redirectToLoginIfNeeded() async {
    var isLoggedIn = await LoginActions.isLoggedIn();

    if(!isLoggedIn) {
      Navigator.pushNamed(context, LoginScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              'a',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text(widget.title),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.exit_to_app),
            onPressed: _onLogoutButtonClicked,
        )
      ],
    );
  }

  void _onLogoutButtonClicked() async {
    await LoginActions.performLogout();
    Navigator.pushNamed(context, LoginScreen.route);
  }
}
