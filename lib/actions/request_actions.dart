import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:meetup_sample/models/item.dart';

class RequestActions {

  static Future<List<Item>> fetchItems() async {
    var response = await get('https://7cd67769-7891-463b-96e5-8026538f7ae8.mock.pstmn.io/get-items');

    var items = json.decode(response.body) as List;

    return items.map((item) => new Item.fromJson(item)).toList();
  }

}