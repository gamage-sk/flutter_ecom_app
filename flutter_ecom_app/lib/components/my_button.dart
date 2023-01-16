import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {

final Function()? onTap;
final String text;

const MyButton({
  super.key, 
  required this.onTap, 
  required this.text});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20)
        ),
      child:  Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, 
            fontSize: 20,
            ),
          ),) ,
    ),
    );
  }
}