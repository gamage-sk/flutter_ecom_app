// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecom_app/screen/login_screen.dart';
// import 'package:flutter_ecom_app/screen/profile_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// class HomeScreen extends StatelessWidget {
//    HomeScreen({super.key});

//   final user = FirebaseAuth.instance.currentUser()!;

//   Future<void> signUserOut() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     await googleSignIn.signOut();
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(actions: [
//       IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
//       ]),
//       body: SafeArea(
//          child: Column(
               
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
              
//               CircleAvatar(
//                 radius: 20,
//                 backgroundImage: NetworkImage(
//                    user.photoURL!),
//               ),

//                 SizedBox(height: 25 ),

//               Column(
//                   children: [
//                   FloatingActionButton(
//                   onPressed: () {
//             Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => profilescreen()
//             ),
//             );
//            },),
//                 ],
//               )
     
//       ],
//       ),
//       )
       
//     )
//   };