import 'package:easy_flutter_game/game/components/enemy.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Bullet extends CircleComponent with HasGameRef, CollisionCallbacks {
  static const double bulletSize = 10;
  late final bool isRight;
  late void Function() callback;

  Bullet(double x, double y, this.isRight, this.callback) {
    this.x = x - bulletSize / 2;
    this.y = y - bulletSize;
    paint = Paint()
      ..color = Colors.yellow;
  }

  @override
  void onMount() {
    super.onMount();
    width = bulletSize;
    height = bulletSize;
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      callback();
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(Offset.zero, 10, paint);
  }
}