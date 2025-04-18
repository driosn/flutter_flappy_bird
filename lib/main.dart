import 'package:flutter/material.dart';
import 'package:flutter_game/aniali.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AniAliHome());
  }
}
