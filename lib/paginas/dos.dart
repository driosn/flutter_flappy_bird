import 'package:flutter/material.dart';

class Dos extends StatelessWidget {
  const Dos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Pagina dos'),
        backgroundColor: Colors.green.shade900,
      ),
    );
  }
}
