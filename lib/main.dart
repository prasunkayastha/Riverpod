import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
