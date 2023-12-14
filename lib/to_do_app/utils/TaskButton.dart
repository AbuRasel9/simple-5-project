import 'package:flutter/material.dart';
class TaskButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const TaskButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,

      onPressed: onTap,
      child: Text(buttonText),


    );
  }
}
