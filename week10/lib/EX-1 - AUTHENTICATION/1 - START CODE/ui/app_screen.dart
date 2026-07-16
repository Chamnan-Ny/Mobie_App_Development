import 'package:flutter/material.dart';
import 'package:week10/EX-1%20-%20AUTHENTICATION/1%20-%20START%20CODE/data/services/auth_service.dart';
import 'package:week10/EX-1%20-%20AUTHENTICATION/1%20-%20START%20CODE/ui/scores_screen.dart';
import 'auth_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  void onLogin() {
    setState(() {});
  }

  void onLogout() {
    // 1. Clear the session in the service
    AuthenticationService.instance.logout();

    // 2. Refresh the UI so the 'content' getter re-evaluates
    setState(() {});
  }

  Widget get content {
    // if logged in -> Display ScoresScreen
    if (AuthenticationService.instance.isLoggedIn) {
      return ScoresScreen(onLogout: onLogout);
    } else {
      // otherwise -> DisplayAuthScreen
      return AuthScreen(onLogin: onLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
