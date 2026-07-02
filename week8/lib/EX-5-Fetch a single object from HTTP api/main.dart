// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// void main() async {
//   Uri url = Uri.parse('https://fooapi.com/api/products');

//   // 1- Get the request response
//   Response response = await http.get(url);

//   // 2- Check the responsae status
//   if (response.statusCode != 200) {
//     throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
//   }

//   // 3- Parse the response
//   Map<String, dynamic> json = jsonDecode(response.body);
//   List<dynamic> jsonItems = json["data"];

//   Map<String, dynamic> jsonItem = jsonItems[0];

//   Product product = Product.fromJson(jsonItem);
//   print(product);
// }

// class Product {
//   final String title;
//   final double price;

//   Product({required this.title, required this.price});

//   static Product fromJson(Map<String, dynamic> json) {
//     const String titleKey = 'title';
//     const String priceKey = 'price';

//     assert(json[titleKey] is String);
//     assert(json[priceKey] is double);

//     String title = json[titleKey];
//     double price = json[priceKey];

//     return Product(title: title, price: price);
//   }

//   @override
//   String toString() {
//     return "Product $title - price= $price";
//   }
// }

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() async {
  // Create API url
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  // Send htttp request
  Response response = await http.get(url);

  // Check the response status
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch products');
  }

  Map<String, dynamic> json = jsonDecode(response.body);
  // List<dynamic> jsonItems = json['data'];

  Map<String, dynamic> jsonItem = json;

  User user = User.fromJson(jsonItem);
  print(user);
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  static User fromJson(Map<String, dynamic> json) {
    const String nameKey = 'name';
    const String emailKey = 'email';

    assert(json[nameKey] is String);
    assert(json[emailKey] is String);

    String name = json[nameKey];
    String email = json[emailKey];

    return User(name: name, email: email);
  }

  @override
  String toString() {
    return "name : $name - email: $email";
  }
}
