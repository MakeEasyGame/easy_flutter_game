import 'dart:ui' as ui;

import 'package:easy_flutter_game/game/shooting_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class Enemy extends SpriteComponent with HasGameRef<ShootingGame> {
  static const double enemyWidth = 207 / 2;
  static const double enemyHeight = 190 / 2;
  ui.Image? image; // 추가된 부분
  bool facingRight = true;

  @override
  void render(Canvas canvas) {
    if (image != null) {
      canvas.drawImageRect(
        image!,
        Rect.fromLTWH(0, 0, width, height),
        toRect(),
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

}
