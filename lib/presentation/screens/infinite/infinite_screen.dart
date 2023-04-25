import 'package:flutter/material.dart';

class InfiniteScreen extends StatelessWidget {
  static const name = 'infinite_screen';

  const InfiniteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite Screen'),),
    );
  }
}