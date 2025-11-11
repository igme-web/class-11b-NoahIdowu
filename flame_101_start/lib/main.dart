import 'dart:async';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'player.dart';

void main() {
  runApp(GameWidget(
    game: FlameDemoGame(),
  ));
}

class FlameDemoGame extends FlameGame {
  late Player player;
  late JoystickComponent joystick;

  final knobPaint = BasicPalette.red.withAlpha(200).paint();
  final knobBgPaint = BasicPalette.red.withAlpha(100).paint();

  @override
  Future<void> onLoad() async {
    await images.loadAll(["player.png"]);

    joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 15,
        paint: knobPaint,
      ),
      background: CircleComponent(
        radius: 50,
        paint: knobBgPaint,
      ),
      margin: const EdgeInsets.only(left: 20, bottom: 20),
    );

    player = Player(joystick: joystick);
    add(player);
    add(joystick);
  }
}
