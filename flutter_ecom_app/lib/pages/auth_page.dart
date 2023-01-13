import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screen/home_screen.dart';
import 'package:flutter_ecom_app/screen/login_screen.dart';

class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          }

          else{
            return LoginScreen();
          }
          
        }),
      ),
    );
  }
}