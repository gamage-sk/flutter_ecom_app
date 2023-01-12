import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
 const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {



final _forKey = GlobalKey<FormState>();

final firstNameEditingController = new TextEditingController();
final secondNameEditingController = new TextEditingController();
final emailEditingController = new TextEditingController();
final passwordEditingController = new TextEditingController();
final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

     final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {

         firstNameEditingController.text = value!;
        
      },

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );

     final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {

         secondNameEditingController.text = value!;
        
      },

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );

     final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {

         emailEditingController.text = value!;
        
      },

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );

     
     final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {

         passwordEditingController.text = value!;
        
      },

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );


     final confirmPasswordField = TextFormField(

      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      onSaved: (value) {

         confirmPasswordEditingController.text = value!;
        
      },

      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
   
   
     final signUpButton = Material(
       elevation: 5,
       borderRadius: BorderRadius.circular(30),
       color: Colors.lightBlueAccent,
       child: MaterialButton(
       padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
       minWidth: MediaQuery.of(context).size.width,
       onPressed: () {},
       child: Text("SignUp",
         textAlign: TextAlign.center,
         style: TextStyle(
         fontSize: 20, color: Colors.white , fontWeight: FontWeight.bold),
                    ),
  ),
);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.blue), 
          onPressed: () { 
             
             Navigator.of(context).pop();

           },
           ),
      ),
      body: Center(
        child:SingleChildScrollView(
          child:Container(
            color: Colors.white,
            child:Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _forKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   

                   SizedBox(
                    height: 180,
                    child: Image.asset("assets/logo.jpg",
                    fit: BoxFit.contain,)
                   ),
                   SizedBox(height: 20 ),
                    firstNameField,
                   SizedBox(height: 20 ),
                    secondNameField,
                   SizedBox(height: 20 ),
                    emailField,
                   SizedBox(height: 20),
                    passwordField,
                   SizedBox(height: 20),
                    confirmPasswordField,
                   SizedBox(height: 20 ),
                   signUpButton,
                   SizedBox(height: 20 ),
                   
                  
 
                  ],
                )
              ),
            ),

          )
        )
        ),
    );
  }
}