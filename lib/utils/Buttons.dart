import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
 Buttons({ Key? key, required this.text, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xfff222831),
      child: Text(text,
      style:GoogleFonts.robotoMono(color: Color(0xfffeeeee)),
      ),
    );
  }
}