import 'dart:convert';
import 'package:http/http.dart' as http;

import 'data.dart';

const uril =
    "https://script.google.com/macros/s/AKfycbzRUUn23KEcys3GwRch3MpCC80pBKfmmIDlTBLs02Hn-CZyMckIggY_QWR1aXXiEkOI9w/exec";

Future<List<Data>> fetchData() async {
  final response = await http.get(Uri.parse(uril));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
