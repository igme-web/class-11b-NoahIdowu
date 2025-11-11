import 'dart:async';
import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameReference<FlameDemoGame> {
  final JoystickComponent joystick;

  Player({required this.joystick});

  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("player.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 300 * dt);
      angle = joystick.delta.screenAngle();
    }
  }
}
