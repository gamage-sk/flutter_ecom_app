import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class profilescreen extends StatelessWidget {
   profilescreen({super.key});

final user = FirebaseAuth.instance.currentUser()!;
//  final user = FirebaseAuth.instance.currentUser;


     Future<void> signUserOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
  }
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
      IconButton(onPressed: signUserOut, icon: Icon(Icons.logout),)
      ], backgroundColor: Colors.blueGrey,),
      body: SafeArea(
        child: Container(
          height: 1000,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey,
            // image: DecorationImage(
            //   image: NetworkImage(
            //       user.photoURL!),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    user.photoURL!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user.displayName!,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user.email!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    user.uid! ,
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    user.email!,
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
