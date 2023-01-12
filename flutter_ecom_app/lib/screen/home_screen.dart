import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  // child: Image.asset("assets/logo.png", fit: BoxFit.contain,
                  // ),
                ),
                Text("Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Name",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                )),
                 Text("Email",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(
                  height: 15
                ),
                ActionChip(label: Text("Logout"),onPressed: () {
           Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
    },)
              ],)
          )),
    );
  }
}