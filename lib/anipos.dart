import 'dart:math';

import 'package:flutter/material.dart';

class AniPosHome extends StatefulWidget {
  const AniPosHome({super.key});

  @override
  State<AniPosHome> createState() => _AniPosHomeState();
}

class _AniPosHomeState extends State<AniPosHome> {
  int pos = 0;
  List<Color> vColor = [Colors.red, Colors.green, Colors.blue, Colors.teal];

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    List<List<double>> mLimites = [
      [0, screen.width / 2, screen.height / 2, 0, 0, screen.width, screen.height, 0],
      [0, 0, screen.height / 2, screen.width / 2, 0, 0, screen.height, screen.width],
      [screen.height / 2, 0, 0, screen.width / 2, screen.height, 0, 0, screen.width],
      [screen.height / 2, screen.width / 2, 0, 0, screen.height, screen.width, 0, 0],
    ];
    return Scaffold(
      body: Stack(
        children: [
          /*
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: w,
            height: h,

          ),
          */
          cortina(mLimites, vColor[0], 0),
          cortina(mLimites, vColor[1], 1),
          cortina(mLimites, vColor[2], 2),
          cortina(mLimites, vColor[3], 3),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          pos = (pos + 1) % 2;
        },
      ),
    );
  }

  Widget cortina(m, color, fila) {
    return AnimatedPositioned(
      top: m[fila][0 + pos * 4],
      right: m[fila][1 + pos * 4],
      bottom: m[fila][2 + pos * 4],
      left: m[fila][3 + pos * 4],
      duration: Duration(milliseconds: 1000),
      child: GestureDetector(
        onTap: () {
          print(' fila = $fila ');
          var gran = Random();

          setState(() {
            vColor[fila] = Color.fromARGB(1000, gran.nextInt(256), gran.nextInt(256), gran.nextInt(256));
          });
        },
        onPanDown: (desp) {
          print(' x = ${desp.globalPosition.dx}   y = ${desp.globalPosition.dy} ');
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, color], begin: Alignment.bottomLeft, end: Alignment(1, 1)),
          ),
          //color: color
        ),
      ),
    );
  }
}
