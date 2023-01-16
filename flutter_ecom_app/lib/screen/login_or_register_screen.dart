import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screen/login_screen.dart';
import 'package:flutter_ecom_app/screen/registration_screen.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends State<LoginOrRegisterPage> {

bool showLoginPage = true ;

void togglePages() {
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        onTap: togglePages,);
    }
    else {
    return RegisterScreen(
      onTap: togglePages,
      );
    }
  
  }
}