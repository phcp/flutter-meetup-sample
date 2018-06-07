import 'package:flutter/material.dart';
import 'package:meetup_sample/actions//login_actions.dart';
import 'package:meetup_sample/actions/request_actions.dart';
import 'package:meetup_sample/models/item.dart';
import 'package:meetup_sample/screens/add_item_screen.dart';
import 'package:meetup_sample/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key}) : super(key: key);

  static const String route = '/home';
  final String title = 'Liferay Meetup';

  @override
  _HomeScreenState createState() => new _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  List<Item> _items;

  @override
  void initState() {
    super.initState();

    _setupInitialState();
  }

  void _setupInitialState() async {
    var isLoggedIn = await LoginActions.isLoggedIn();

    if(!isLoggedIn) {
      Navigator.pushNamed(context, LoginScreen.route);
    }
    else {
      var items = await RequestActions.fetchItems();

      setState(() {
        _items = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: new ListView(
        children: _buildListTiles(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFabPressed,
        tooltip: 'Add Item',
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
            onPressed: _onLogoutButtonPressed,
        ),
      ],
    );
  }

  List<Widget> _buildListTiles() {
    var listTiles = new List<Widget>();

    if(_items?.isNotEmpty ?? false) {
      listTiles = _items.map(
              (item) => new ListTile(
            title: new Text(item.name),
            subtitle: new Text(item.id.toString()),
          )
      ).toList();
    }
    return listTiles;
  }

  void _onFabPressed() async {
    var newItemId = _items.length + 1;

    final Item newItem = await Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (builder) => new AddItemScreen(nextItemId: newItemId)
      ),
    );

    if(newItem != null) {
      setState(() {
        _items.add(newItem);
      });
    }
  }

  void _onLogoutButtonPressed() async {
    await LoginActions.performLogout();
    Navigator.pushNamed(context, LoginScreen.route);
  }
}
