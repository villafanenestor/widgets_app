import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('progress Screen'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('Cicular progress indicator'),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.white54,
          ),
          SizedBox(
            height: 30,
          ),
          Text('Cicular y lineal progress controlado'),
          SizedBox(
            height: 30,
          ),
          _ControlerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlerProgressIndicator extends StatelessWidget {
  const _ControlerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValue,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
