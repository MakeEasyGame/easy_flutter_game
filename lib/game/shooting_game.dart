import 'package:easy_flutter_game/game/components/bullet.dart';
import 'package:easy_flutter_game/game/components/enemy.dart';
import 'package:easy_flutter_game/game/components/ground.dart';
import 'package:easy_flutter_game/game/components/player.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class ShootingGame extends FlameGame
    with PanDetector, HasCollisionDetection, KeyboardEvents {
  static const double playerSpeed = 10;
  static const bulletSpeed = 20;

  late Player player;
  late Ground ground;
  late Enemy enemy;
  List<Bullet> bullets = [];

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
    // 총알 이동
    bullets.forEach((bullet) {
      if (bullet.isRight) {
        bullet.x += bulletSpeed;
      } else {
        bullet.x -= bulletSpeed;
      }
    });

    // 총알과 벽 간에 충돌 처리
    bullets.removeWhere((bullet) {
      if (bullet.x > size.x || bullet.x < 0) {
        remove(bullet);
        return true;
      }
      return false;
    });

    if (enemy.life == 0) {}
  }

  void shoot() {
    final bullet = Bullet(
        player.facingRight ? player.x + player.width : player.x - player.width,
        player.y + player.height / 2,
        player.facingRight, () {

    });
    bullets.add(bullet);
    add(bullet);
  }
}
