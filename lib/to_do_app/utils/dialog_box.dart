import 'package:flutter/material.dart';
import 'package:simple_project/to_do_app/utils/TaskButton.dart';

class DialogBox extends StatelessWidget {
  final taskController;
  final VoidCallback onSave;
  final VoidCallback onCancell;

   DialogBox({
    super.key,
    required this.taskController,
    required this.onSave,
    required this.onCancell,
  });

  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.greenAccent,
      content: Container(
        height: 170,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //add task feild
              Form(
                key: _key,
                child: TextFormField(
                  validator: (String? value) {
                    if(value!.isEmpty ?? true){
                      return "Enter VAlue";
        
                    }
                    return null;
                  },
                  controller: taskController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add New Task"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
        
              //save button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskButton(
                    buttonText: 'Save',
                    onTap: (){
                      if(_key.currentState!.validate()){
                        onSave;
                      }
                    },
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
      ),
    );
  }
}
