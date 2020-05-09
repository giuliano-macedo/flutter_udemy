import "package:flutter/material.dart";
import "./mytext.dart";

class TextControl extends StatelessWidget {
  final String text;
  TextControl(this.text);
  @override
  Widget build(BuildContext context) {
    return MyText(text);
  }
}