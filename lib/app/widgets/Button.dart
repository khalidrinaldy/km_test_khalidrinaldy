import 'package:flutter/material.dart';

basicButtonStyle({color = const Color(0xFF2B637B), borderColor = const Color(0xFF2B637B)}) {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(1),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(color),
  );
}