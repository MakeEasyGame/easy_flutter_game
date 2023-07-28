import 'dart:ui' as ui;

import 'package:easy_flutter_game/game/shooting_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent with HasGameRef<ShootingGame> {
  static const double playerSize = 50;
  ui.Image? playerImage; // 추가된 부분
  bool facingRight = true;

  @override
  void render(Canvas canvas) {
    if (playerImage != null) {
      canvas.drawImageRect(
        playerImage!,
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
    playerImage = await Flame.images.load('player.png');
    sprite = Sprite(playerImage!);
    width = playerSize;
    height = playerSize;
  }

  void moveLeft() {
    if (facingRight) flipHorizontallyAroundCenter();
    facingRight = false;
    if (x - width <= 0) return;
    x -= ShootingGame.playerSpeed;
  }

  void moveRight() {
    if (!facingRight) flipHorizontallyAroundCenter();
    facingRight = true;
    if (x >= gameRef.size.x - width) return;
    x += ShootingGame.playerSpeed;
  }
}
