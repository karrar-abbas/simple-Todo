import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DialogButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  DialogButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color:Colors.grey[300],
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
