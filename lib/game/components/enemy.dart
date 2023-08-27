import 'dart:ui' as ui;

import 'package:easy_flutter_game/game/components/bullet.dart';
import 'package:easy_flutter_game/game/shooting_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class Enemy extends SpriteComponent
    with HasGameRef<ShootingGame>, CollisionCallbacks {
  static const double enemyWidth = 207 / 2;
  static const double enemyHeight = 190 / 2 + 50;
  ui.Image? image; // 추가된 부분
  bool facingRight = true;
  int life = 100;

  @override
  void onMount() {
    super.onMount();
    final shape = RectangleHitbox.relative(
      Vector2(1, 1),
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);

  }

  @override
  void render(Canvas canvas) {
    if (image != null) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, width * (life / 100), 20),
        Paint()..color = Colors.green
          ..style = PaintingStyle.fill
      );
      canvas.drawRect(
          Rect.fromLTWH(0, 0, width, 20),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = Colors.white);
      canvas.drawImageRect(
        image!,
        Rect.fromLTWH(0, 0, width, enemyHeight - 50),
        Rect.fromLTWH(0, 50, width, enemyHeight - 50),
        Paint(),
      );
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    await _loadImage();
    super.onLoad();
  }

  Future<void> _loadImage() async {
    image = await Flame.images.load('enemy.png');
    sprite = Sprite(image!);
    width = enemyWidth;
    height = enemyHeight;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      if (life > 0) {
        life -= 5;
      }
    }
  }
}
