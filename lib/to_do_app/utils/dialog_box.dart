import 'package:flutter/material.dart';
import 'package:simple_project/to_do_app/utils/TaskButton.dart';

class DialogBox extends StatelessWidget {
  final taskController;
  final VoidCallback onSave;
  final VoidCallback onCancell;

  const DialogBox({
    super.key,
    required this.taskController,
    required this.onSave,
    required this.onCancell,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.greenAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //add task feild
            TextFormField(
              validator: (String? value) {
                return null;
              },
              controller: taskController,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add New Task"),
            ),
            SizedBox(
              height: 10,
            ),

            //save button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TaskButton(
                  buttonText: 'Save',
                  onTap: onSave,
                ),
                SizedBox(
                  width: 12,
                ),
                TaskButton(buttonText: 'Cancell', onTap: onCancell),
              ],
            )
          ],
        ),
      ),
    );
  }
}
