
import 'package:easy_flutter_game/view/game_view.dart';
import 'package:easy_flutter_game/view/ready_view.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/ready',
      routes: {
        '/ready': (context) => const ReadyView(),
        '/game': (context) => const GameView(),
      },
    )
  );
}