import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screen/login_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(actions: [
      IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      body: Center(child: Text("Logged IN!")),
    );
  }
}