
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_ecom_app/components/my_button.dart';
import 'package:flutter_ecom_app/components/my_textfield.dart';
import 'package:flutter_ecom_app/components/square_tile.dart';
import 'package:flutter_ecom_app/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {

   final Function()? onTap;
   const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {

   final usernameController = TextEditingController();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();


   void signUserUp() async{

        showDialog(context: context, builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),

          );
        });

      try {
        if(passwordController.text == confirmpasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
               
               email: emailController.text,
               password: passwordController.text,

         );
         }    else {
          showErrorMessage("Passwords don't match!");
         }
 
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
        
          // Icon(
          //   Icons.shopping_cart_outlined,
          //   size: 150,
          // ),
              Image.asset("lib/icon/cart.png",
             
             width: 200,
              height: 200,
              // fit: BoxFit.contain,
              ),
              
             SizedBox(height: 25,),
        
             Text(
              "Let\'s create an account for you!",
              style: TextStyle(color: Colors.grey[700],
              fontSize: 16),
              ),
        
              const SizedBox(height: 25,),

               MyTextField(
                  hintText: 'User Name' ,
                obscureText:false ,
                controller: usernameController,
        
                ),
      
          const SizedBox(height: 10,),
              
        
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

            MyTextField(
                  hintText: 'Confirm Password' ,
                obscureText:true ,
                controller: confirmpasswordController,
        
                ),
      
          const SizedBox(height: 25,),


          




        
              
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
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
            Text('Alrady have an account?',
            style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 4,),
            GestureDetector(
              onTap: widget. onTap,
              child: const Text(
                'Login now',
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








































// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecom_app/screen/home_screen.dart';
// import 'package:flutter_ecom_app/screen/registration_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() =>  _LoginScreenState();
// }


// class  _LoginScreenState extends State<LoginScreen> {

//     final _formKey = GlobalKey<FormState>();

//     final TextEditingController emailController = new TextEditingController();
//     final TextEditingController passwordController = new TextEditingController();

  
//       void SignUserIn() async {
//         await FirebaseAuth.instance.signInWithEmailAndPassword
//         (email: emailController.text,
//          password: passwordController.text,
//      );
//   }


 
//   @override
//   Widget build(BuildContext context) {

//     final emailField = TextFormField(
//       autofocus: false,
//       controller: emailController,
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (value) {

//          emailController.text = value!;
        
//       },

//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.mail),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//       ),
//     );


//     final passwordField = TextFormField( 
//       autofocus: false,
//       controller: passwordController,
//       obscureText: true,
//       onSaved: (value) {

//          passwordController.text = value!;
        
//       },

//       textInputAction: TextInputAction.next,
//        decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//       ),
//     );

// final loginButton = Material(
//   elevation: 5,
//   borderRadius: BorderRadius.circular(30),
//   color: Colors.lightBlueAccent,
//   child: MaterialButton(
//     padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//     minWidth: MediaQuery.of(context).size.width,
//     onPressed: () {
//           SignUserIn();
//     },
//     child: Text("Login",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20, color: Colors.white , fontWeight: FontWeight.bold),
//                     ),
//   ),
// );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child:SingleChildScrollView(
//           child:Container(
//             color: Colors.white,
//             child:Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
                   

//                    SizedBox(
//                     height: 200,
//                     child: Image.asset("assets/logo.jpg",
//                     fit: BoxFit.contain,)
//                    ),
//                    SizedBox(height: 10 ),
//                     emailField,
//                    SizedBox(height: 25),
//                     passwordField,
//                    SizedBox(height: 35),
//                     loginButton,
//                    SizedBox(height: 15),
                   
//                    Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                        Text("Don't have an account? "),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),
//                         )
//                         );
//                       },
//                       child: Text("SignUp",
//                       style: TextStyle(color: Colors.lightBlueAccent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15),
//                       ),
//                     ),
//                     ],
//                    )
 
//                   ],
//                 )
//               ),
//             ),

//           )
//         )
//         ),
//     );
//   }
// }












































