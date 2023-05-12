import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name= "counterScreen";
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeProvider);
    int contador =0;
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          final theme  = ref.read(themeProvider.notifier).update((state) => !state);
          print(theme);
        }, icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode))],
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter'),
            Text('${clickCounter}'),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one_outlined),
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state+1);
        },
      ),
    );
  }
}