import 'package:flutter/material.dart';
import 'package:river_pod/view/counter_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterView(),
    );
  }
}
