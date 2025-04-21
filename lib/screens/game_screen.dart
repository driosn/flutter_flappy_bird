import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_game/widgets/obstacle_container.dart';
import 'package:rive/rive.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final double xPosition = -0.6;
  double yPosition = 0;
  late final Timer _timer;

  late final List<ObstacleContainer> _obstacleContainers;

  @override
  void initState() {
    super.initState();

    _obstacleContainers = [];
    _initPeriodicalObstacleBuilding();
  }

  void _initPeriodicalObstacleBuilding() {
    Timer.periodic(Duration(milliseconds: (1000 / 60).toInt()), (_) {
      if (_obstacleContainers.isNotEmpty) {
        final key = _obstacleContainers.first.key as GlobalObjectKey;

        final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
        final Offset position = box.localToGlobal(Offset.zero);
        print('Position: $position');
      }
    });

    Timer.periodic((Duration(milliseconds: 1750)), (timer) {
      print(timer.tick);
      setState(() {
        final key = GlobalObjectKey(timer.tick);

        _obstacleContainers.add(
          ObstacleContainer(
            key: key,
            parentContext: context,
            onObstacleAnimationEnded: (obstacle) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _obstacleContainers.remove(obstacle);
                  print(_obstacleContainers);
                });
              });
            },
          ),
        );
      });
    });
  }

  void _onTapGameScreen() {
    setState(() {
      //x = 2 * gran.nextDouble() - 1;
      //y = 2 * gran.nextDouble() - 1;
      // x = 0;
      // y = -1;

      final newYPosition = yPosition + (-0.25);

      if (newYPosition > 1) {
        yPosition = 1;
      } else {
        yPosition = newYPosition;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedAlign(
            alignment: Alignment(xPosition, yPosition),
            duration: Duration(milliseconds: 230),
            curve: Curves.linear,
            onEnd: () {
              /*
              setState(() {
                x = 2 * gran.nextDouble() - 1;
                y = 2 * gran.nextDouble() - 1;
              });
              */
              setState(() {
                final newYPosition = yPosition - (0.25);

                if (newYPosition < 0) {
                  yPosition = 0;
                } else {
                  yPosition = newYPosition;
                }
              });
            },
            child: SizedBox(
              height: 120,
              width: 120,
              child: RiveAnimation.asset('assets/flying_bird.riv', fit: BoxFit.contain, useArtboardSize: false),
            ),
          ),
          GestureDetector(
            onTap: _onTapGameScreen,
            child: Container(height: double.infinity, width: double.infinity, color: Colors.transparent),
          ),
          ..._obstacleContainers,
        ],
      ),
    );
  }
}
