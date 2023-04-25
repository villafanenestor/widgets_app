import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      body: const _Buttons_View(),
    );
  }
}

class _Buttons_View extends StatelessWidget {
  void onPressed() {}

  const _Buttons_View({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          // crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Elevate button'),
            ),
            ElevatedButton(
              onPressed: null,
              child: const Text('Elevate disabled'),
            ),
            ElevatedButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Icon')),
            FilledButton(
                onPressed: onPressed, child: const Text('FIll Button')),
            FilledButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.exit_to_app),
                label: Text('Fill Icon')),
            OutlinedButton(onPressed: onPressed, child: Text('Outline')),
            OutlinedButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.outbond),
                label: Text('Outline')),
            TextButton(onPressed: onPressed, child: Text('Text Button')),
            TextButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.access_alarms_outlined),
                label: Text('Text Button')),
            IconButton(onPressed: onPressed, icon: Icon(Icons.downhill_skiing)),
            const _CustomButton(),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({super.key});


  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        // borderRadius: BorderRadius.circular(15),
        child: InkWell(
          hoverColor: colors.secondary,
          focusColor: colors.tertiary,
          splashColor: colors.tertiary,
          highlightColor: colors.tertiary,
          onTap: (){},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Hola mundo',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
