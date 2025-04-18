import 'package:flutter/material.dart';

class Uno extends StatelessWidget {
  const Uno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Pagina uno'),
        backgroundColor: Colors.red.shade900,
      ),
    );
  }
}
