
// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:todo/utils/Buttons.dart';


class DialogBox extends StatelessWidget {
 
 final controller; 
 VoidCallback onSave;
 VoidCallback onCancel;


 DialogBox({super.key,required this.controller,
 required this.onSave,
 required this.onCancel,
 });

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Color(0xfff00ADB5),
      content: Container(height: 120,
      //get user input 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller ,
            decoration:const InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide( color: Colors.white,width: 3),
              ),
              hintText: "Add a new task",
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xfff222831),
              width: 3
              )
              ),
            ),
          ),   
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //add button
                Buttons(text: "Save", onPressed: onSave),
              const SizedBox(width: 20,),
              //cancel button   
                Buttons(text: "Cancel", onPressed:onCancel),
            ],
          )

        ],
      ),
      ),
    );
  }
}