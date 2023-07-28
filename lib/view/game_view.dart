import 'package:easy_flutter_game/game/shooting_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    var shootingGame = ShootingGame();

    return Scaffold(
      backgroundColor: Colors.black,
      body: KeyboardListener(
        focusNode: focusNode,
        onKeyEvent: (KeyEvent event) {
          if (event is! KeyUpEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              shootingGame.player.moveLeft();
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              shootingGame.player.moveRight();
            }
            if (event.logicalKey == LogicalKeyboardKey.space) {
              // shootingGame.player.shoot();
            }
          }
        },
        child: GameWidget(
          game: shootingGame,
        ),
      ),
    );
  }
}
