import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screen/login_screen.dart';
import 'package:flutter_ecom_app/screen/profile_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser()!;

  Future<void> signUserOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(actions: [
      IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      
      body: Center(
        

        // add an elevation
        child: Row(
          children: [                      
                     SizedBox(width: 200,),  
            Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 
               children: [
                    SizedBox(height: 20,),  

            ElevatedButton(
              onPressed: (){}, 
              child: Text("logout"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                    ),
                    ),

                Material(
                        elevation: 10,
                         shape: const CircleBorder(),
                         clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                        image: NetworkImage(user.photoURL!),
                        fit: BoxFit.cover,
                        width: 70.0,
                        height: 70.0,
                        child: InkWell(
                        onTap: () {
                           Navigator.pushReplacement(
                           context, MaterialPageRoute(builder: (context) => profilescreen()
                    ),
                    );
      },
    ),
  ),
   ),
              ],
            ),
          ],
        )
      ),
);
  }
}
