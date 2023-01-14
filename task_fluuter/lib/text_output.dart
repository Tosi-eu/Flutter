import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String mainText;

  const TextOutput(this.mainText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(mainText);
  }
}
