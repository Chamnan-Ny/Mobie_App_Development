import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:week10/EX-1%20-%20AUTHENTICATION/1%20-%20START%20CODE/model/user.dart';

import '../../model/auth_session.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body with the name and password
    final body = jsonEncode({"name": name, "password": password});

    // 2- Fetch the POST/login
    Response response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    // 3- Decode the json
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // 5 -  Get the token
      final String token = data["token"];
      // 5 -  Get the user
      final User user = User.fromJSon(data["user"]);

      // 6 - Update the session
      session = AuthSession(token: token, user: user);
    } else {
      // 4 - If failed, throw a AuthException
      throw AuthException("Invalid Credentails : ${response.statusCode}");
    }
  }

  void logout() {
    session = null;
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
