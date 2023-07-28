import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ground extends RectangleComponent {
  static const double groundHeight = 500;

  Ground(double width)
      : super.square(
          size: width,
          position: Vector2(0, 500),
          paint: Paint()..color = Colors.white,
        );
}
