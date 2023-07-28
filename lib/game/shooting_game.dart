import 'package:easy_flutter_game/game/components/enemy.dart';
import 'package:easy_flutter_game/game/components/ground.dart';
import 'package:easy_flutter_game/game/components/player.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class ShootingGame extends FlameGame with PanDetector, HasCollisionDetection, KeyboardEvents {

  static const double playerSpeed = 10;

  late Player player;
  late Ground ground;
  late Enemy enemy;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    player = Player();
    ground = Ground(size.x);
    enemy = Enemy();

    add(ground);
    add(player);
    add(enemy);

    player.y = Ground.groundHeight - Player.playerSize;
    enemy.y = Ground.groundHeight - Enemy.enemyHeight;
    enemy.x = size.x / 2 - Enemy.enemyWidth / 2;
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