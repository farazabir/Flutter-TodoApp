import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class Todolist extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function (BuildContext)? deleteFunction;

  Todolist({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion() ,
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red.shade200, 
            borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Color(0xfff222831),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: Colors.white),
              ),

              //Task name
              Text(
                taskName,
                style: GoogleFonts.robotoMono(
                    color: Color(0xfffeeeee),
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    decorationThickness: 5,
                    decorationColor: Color(0xfffCF0A0A)),
                    
              ),
            ],
          ),
        ),
      ),
    );
  }
}
