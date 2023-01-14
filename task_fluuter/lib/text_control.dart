import 'package:flutter/material.dart';

import './text_output.dart';

class TextControl extends StatefulWidget {
  const TextControl({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _mainText = 'Detector de clique';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                _mainText = 'Clicou!';
              });
            },
            child: const Text('Clique aqui')),
        TextOutput(_mainText)
      ],
    );
  }
}
