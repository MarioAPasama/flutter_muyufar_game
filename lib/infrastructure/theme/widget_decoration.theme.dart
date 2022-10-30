import 'package:flutter/material.dart';

InputDecoration inputInputDecorationRounded = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(10.0),
  ),
  // filled: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
  hintStyle: const TextStyle(color: Colors.grey),
  fillColor: Colors.white70,
);

BoxDecoration inputBoxDecorationRounded = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
);
