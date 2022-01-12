import 'package:flutter/material.dart';

class BasicDialog extends StatelessWidget {
  final title;
  final content;
  const BasicDialog({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      titleTextStyle: TextStyle(fontFamily: "Poppins", color: Color(0xFF2B637B), fontWeight: FontWeight.bold, fontSize: 20),
      contentTextStyle: TextStyle(fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}