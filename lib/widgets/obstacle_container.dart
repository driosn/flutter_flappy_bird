import 'dart:math';

import 'package:flutter/material.dart';

class ObstacleContainer extends StatefulWidget {
  const ObstacleContainer({required this.key, required this.parentContext, required this.onObstacleAnimationEnded})
    : super(key: key);

  @override
  final Key key;
  final BuildContext parentContext;
  final Function(ObstacleContainer) onObstacleAnimationEnded;

  @override
  State<ObstacleContainer> createState() => _ObstacleContainerState();
}

class _ObstacleContainerState extends State<ObstacleContainer> {
  final double fixedObstacleSize = 150;
  late double screenHeight = MediaQuery.of(widget.parentContext).size.height;

  late final (double topHeight, double bottomHeight) obstacleHeights;

  ///
  /// Obstacle Position
  ///
  double xPosition = 2.5;
  double yPosition = -1;

  @override
  void initState() {
    super.initState();

    obstacleHeights = _generateTopAndBottomHeights();
    _animate();
  }

  (double topHeight, double bottomHeight) _generateTopAndBottomHeights() {
    final topHeight = Random().nextDouble() * (screenHeight - fixedObstacleSize);
    final bottomHeight = screenHeight - fixedObstacleSize - topHeight;

    return (topHeight, bottomHeight);
  }

  void _animate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        xPosition = xPosition * -1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: 0,
      right: xPosition,
      duration: Duration(milliseconds: 1750),
      onEnd: () => widget.onObstacleAnimationEnded(widget),
      child: ObstacleColumn(topHeight: obstacleHeights.$1, bottomHeight: obstacleHeights.$2),
    );
  }
}

class ObstacleColumn extends StatelessWidget {
  const ObstacleColumn({super.key, required this.topHeight, required this.bottomHeight});

  final double topHeight;
  final double bottomHeight;

  final double fixedObstacleSize = 150;

  @override
  Widget build(BuildContext context) {
    print(topHeight);

    return Column(
      children: [
        Container(height: topHeight, width: fixedObstacleSize, color: Colors.green),
        Container(height: fixedObstacleSize, width: fixedObstacleSize, color: Colors.transparent),
        Container(height: bottomHeight, width: fixedObstacleSize, color: Colors.green),
      ],
    );
  }
}
