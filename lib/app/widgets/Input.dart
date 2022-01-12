import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final data;
  final onChanged;
  final hintText;
  const Input({Key? key, this.data, this.onChanged, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: data,
      onChanged: onChanged,
      style: TextStyle(fontSize: 20, color: Color(0xFF686777), fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 20, color: Color(0xFF686777).withOpacity(0.36), fontWeight: FontWeight.w500),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(
          left: 10,
          bottom: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
