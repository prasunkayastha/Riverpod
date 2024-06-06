import 'package:flutter_riverpod/flutter_riverpod.dart';

final CounterViewModelProvider =
    StateNotifierProvider<CounterViewModel, int>((ref) {
  return CounterViewModel();
});

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);
  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state == 0) return;
    state = state - 1;
  }
}
