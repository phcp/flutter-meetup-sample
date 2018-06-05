import 'package:flutter/material.dart';
import 'package:meetup_sample/models/item.dart';
import 'package:meetup_sample/widgets/custom_button.dart';
import 'package:meetup_sample/widgets/custom_text_field.dart';

class AddItemScreen extends StatefulWidget {

  AddItemScreen({
    Key key,
    this.nextItemId,
  }) : super(key: key);

  final int nextItemId;

  @override
  State<StatefulWidget> createState() => new _AddItemScreenState(nextItemId);
  
}

class _AddItemScreenState extends State<AddItemScreen> {

  _AddItemScreenState(
    this.nextItemId
  );

  final int nextItemId;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final TextEditingController _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Item'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new CustomTextField(
              label: 'Name',
              controller: _nameController,
            ),
            new CustomButton(
              text: 'Add',
              onPressed: _onAddButtonPressed,
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
    );
  }

  void _onAddButtonPressed() {
    if(_nameController.text.isEmpty) {
      final snackBar = new SnackBar(
        content: new Text('Name is required.'),
        backgroundColor: Colors.redAccent,
      );

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    else {
      Navigator.pop(context, new Item(nextItemId, _nameController.text));
    }
  }
  
}