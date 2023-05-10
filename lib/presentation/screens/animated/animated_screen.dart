import 'dart:math' show Random;
import 'package:flutter/material.dart';



class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.primaries[5];
  double borderRadius = 10;

  void changeShape(){
    final random = Random();

    setState(() {
      width = random.nextDouble()* 256;
      height = random.nextDouble()*256;
      // color = Colors.primaries[random.nextInt(6)];
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),1);
      borderRadius = random.nextDouble()*100;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Screen'),),
      floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.play_arrow_rounded),
      onPressed: changeShape, 
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.decelerate,
          duration: Duration(milliseconds: 1000),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),

        ),
      ),
    );
  }
}