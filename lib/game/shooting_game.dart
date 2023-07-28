import 'package:easy_flutter_game/game/components/ground.dart';
import 'package:easy_flutter_game/game/components/player.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class ShootingGame extends FlameGame with PanDetector, HasCollisionDetection, KeyboardEvents {

  static const double playerSpeed = 10;

  late Player player;
  late Ground ground;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    player = Player();
    ground = Ground(size.x);

    add(ground);
    add(player);

    player.y = size.y - Ground.groundHeight - Player.playerSize;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 플레이어와 바닥 간에 충돌 처리
    if (player.y + player.height > ground.y) {
      player.y = ground.y - player.height;
    }
  }
}