import 'package:flutter/material.dart';
import 'package:flutter_game/paginas/cuatro.dart';
import 'package:flutter_game/paginas/dos.dart';
import 'package:flutter_game/paginas/tres.dart';
import 'package:flutter_game/paginas/uno.dart';

class AniRotHome extends StatefulWidget {
  const AniRotHome({super.key});

  @override
  State<AniRotHome> createState() => _AniRotHomeState();
}

class _AniRotHomeState extends State<AniRotHome> {
  bool flagMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedRotation')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: AnimatedRotation(
              turns: flagMenu ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                width: flagMenu ? 300 : 0,
                height: flagMenu ? 300 : 0,
                //color: Colors.amber,
                child: Stack(
                  children: [
                    nodo(Colors.red, 0, -1, 'A'),
                    nodo(Colors.green, 1, 0, 'B'),
                    nodo(Colors.blue, 0, 1, 'C'),
                    nodo(Colors.pink, -1, 0, 'D'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flagMenu = !flagMenu;
          });
        },
      ),
    );
  }

  Widget nodo(color, double x, double y, msg) {
    return Align(
      alignment: Alignment(x, y),
      child: GestureDetector(
        onTap: () {
          setState(() {
            print(' msg = $msg ');
            switch (msg) {
              case 'A':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Uno()));
                break;
              case 'B':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dos()));
                break;
              case 'C':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tres()));
                break;
              case 'D':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cuatro()));
                break;
            }
          });
        },
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [Colors.white, color]),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(child: Text(msg, style: TextStyle(fontSize: 45))),
        ),
      ),
    );
  }
}
