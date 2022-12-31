import 'package:flutter/material.dart';
import 'package:todo_list/utils/DialogButton.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
   VoidCallback onSave;
   VoidCallback onCancel;
   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel, required this.hint});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      content: Container(
        height: 150,
        child: Column(
          children: [
             TextField(
              controller: controller,
              decoration:  InputDecoration(
                  hintText: hint, border:const OutlineInputBorder()),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                DialogButton(text: 'Save', onPressed:onSave),
                DialogButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
