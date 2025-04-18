import 'dart:math';

import 'package:flutter/material.dart';

class AniAliHome extends StatefulWidget {
  const AniAliHome({super.key});

  @override
  State<AniAliHome> createState() => _AniAliHomeState();
}

class _AniAliHomeState extends State<AniAliHome> {
  double x = 0, y = 1;
  Color colorDefecto = Colors.black;
  var gran = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(x, y),
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceOut,
            onEnd: () {
              /*
              setState(() {
                x = 2 * gran.nextDouble() - 1;
                y = 2 * gran.nextDouble() - 1;
              });
              */
              setState(() {});
              if (y == 1) {
                colorDefecto = Color.fromARGB(100, gran.nextInt(256), gran.nextInt(256), gran.nextInt(256));
              }
              x = 0;
              y = 1;
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [Colors.white, colorDefecto]),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //x = 2 * gran.nextDouble() - 1;
            //y = 2 * gran.nextDouble() - 1;
            x = 0;
            y = -1;
          });
        },
      ),
    );
  }
}
