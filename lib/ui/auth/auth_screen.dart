import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/ui/auth/pages/login_page.dart';
import 'package:flutter_musobaqa/ui/auth/pages/sign_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoginPage
          ? LoginPage(
        onChanged: () {
          setState(() {
            isLoginPage = false;
          });
        },
      )
          : SignPage(
        onChanged: () {
          setState(() {
            isLoginPage = true;
          });
        },
      ),
    );
  }
}