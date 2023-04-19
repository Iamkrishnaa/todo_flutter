import 'package:flutter/material.dart';

class TextFormFieldStyles {
  static var baseTextFormFieldDecoration = const InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  );
  static InputDecoration kRoundedInputDecoration({double radius = 32.0}) {
    return baseTextFormFieldDecoration.copyWith(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }

  static InputDecoration kRoundedInputDecorationNoBorder({
    double radius = 32.0,
  }) {
    return baseTextFormFieldDecoration.copyWith(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
