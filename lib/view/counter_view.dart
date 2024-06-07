import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/view_model/counter-view_model.dart';

final appBarTitleProvider = Provider<String>((ref) => 'Counter App');
final counterProvider = Provider<int>((ref) {
  return 1;
});

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.read(appBarTitleProvider),
        ),
      ),
      body: Center(
        child: Text(
          value.toString(),
          // ref.read(counterProvider).toString(),
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
