
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_ecom_app/components/my_button.dart';
import 'package:flutter_ecom_app/components/my_textfield.dart';
import 'package:flutter_ecom_app/components/square_tile.dart';
import 'package:flutter_ecom_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {

  final Function()? onTap;


   const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final emailController = TextEditingController();

   final passwordController = TextEditingController();

   void signUserIn() async{

        showDialog(context: context, builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),

          );
        });

      try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(

      email: emailController.text,
      password: passwordController.text,

      );
 
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {

      Navigator.pop(context);

      showErrorMessage(e.code);
    }
   } 

   void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context) {
      return  AlertDialog(
        backgroundColor: Color.fromARGB(255, 183, 58, 77),
        title: Center
        (child: Text(
         message,
          style: const TextStyle(color: Colors.white),
          ),
          ),
      );
    },
    );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:   SafeArea(
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children:[
              
              SizedBox(height: 10,),
        
          
              Image.asset("lib/icon/cart.png",
             
             width: 200,
              height: 200,
           
              ),
              
             SizedBox(height: 25,),
        
             Text(
              'Welcome back you\'ve been missed!',
              style: TextStyle(color: Colors.grey[700],
              fontSize: 16),
              ),
        
              const SizedBox(height: 25,),
              
        
               MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
                
               ),
        
              const SizedBox(height: 10,),
          
                MyTextField(
                 hintText: 'Password' ,
                obscureText:true ,
                controller: passwordController,
        
                ),
        
           const SizedBox(height: 10,),
        
        
             Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?' ,
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
             ),
             ),
        
          const SizedBox(height: 25,),
        
              
              MyButton(
                text: "Sign In",
                onTap: signUserIn,
              ),
          
            const SizedBox(height: 25,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: 
              Row(
                children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
        
                Padding(
                  padding: 
                  const EdgeInsets.symmetric(horizontal: 10.0),
        
                 child :Text(
                  'Or continue with'),  
                 
                 ),
                Expanded(
                  child: Divider(
                    thickness:0.5,
                    color: Colors.grey[400], 
                    ),
                    ),
              ],
              ),
            ),
           const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             
              children: [
             SquareTile(
              onTap: () => AuthService().signInWithGoogle(),
              imagePath: 'lib/icon/google.png'),
        
              const SizedBox(width: 10,),
        
              SquareTile(
                onTap: () {
                  
                },
                imagePath: 'lib/icon/apple.png'),
              ],
            ),
               
               const SizedBox(height: 30,),
               Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not a member ?',
            style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 4,),
            GestureDetector(
              onTap: widget. onTap,
              child: const Text(
                'Register now',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
               )

           
              ],
              )
          ),
        )
        
            ),
    );
  }
}

