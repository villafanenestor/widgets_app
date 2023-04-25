import 'package:flutter/material.dart';

class UIControlScreen extends StatelessWidget {
  static const name = 'uicontrolscreen_screen';

  const UIControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Control Screen'),),
    );
  }
}