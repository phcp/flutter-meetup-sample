import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:meetup_sample/models/item.dart';

class RequestActions {

  static Future<List<Item>> fetchItems() async {
    var response = await get('https://7cb4568b-c607-4743-821a-f64b8e2608d3.mock.pstmn.io/get-items');

    var itemsJson = json.decode(response.body);

    return (itemsJson as List).map((item) => new Item.fromJson(item)).toList();
  }

}