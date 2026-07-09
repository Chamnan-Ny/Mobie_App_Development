import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/button_status.dart';

class ButtonRepository {
  static ButtonRepository instance = ButtonRepository();
  Uri url = Uri.parse(
    "https://myfirebase-582f4-default-rtdb.asia-southeast1.firebasedatabase.app/users/user1.json",
  );

  // ignore: non_constant_identifier_names
  Future<ButtonStatus> getButtonStatus() async {
    Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch products (HTTP ${response.statusCode})");
    }
    if (response.body == "null") {
      throw Exception("Cannot fetch the data");
    }
    Map<String, dynamic> json = convert.jsonDecode(response.body);
    // Convert Json map to our object
    return ButtonStatus(name: json['name'], selected: json['selected']);
  }

  Future<void> updateSelectedStatus(bool newStatus) async {
    Response response = await http.patch(
      url,
      body: json.encode({'selected': newStatus}),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to Update");
    }
  }
}
