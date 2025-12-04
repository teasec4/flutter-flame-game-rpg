import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../components/player.dart';
import '../components/enemy.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late Player? player;

  final List<Component> _worldComponents = [];

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    spawnWorld();
  }

  void spawnWorld(){
    // create a Joystick
    final joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 25,
        paint: Paint()..color = Colors.grey,
      ),
      background: CircleComponent(
          radius: 60,
          paint: Paint()..color = const Color(0xFFFFFFFF)
      ),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);
    _worldComponents.add(joystick);

    // create player
    player = Player(joystick)
      ..position = Vector2(200, 300);
    add(player!);
    _worldComponents.add(player!);

    // enemy
    final enemy = Enemy()
      ..position = Vector2(400, 300);
    add(enemy);
    _worldComponents.add(enemy);
  }

  void onPlayerDied(){
    overlays.add('GameOver');
    pauseEngine();
  }

  void restart(){
    for (final c in List<Component>.from(_worldComponents)){
      c.removeFromParent();
    }
    _worldComponents.clear();
    resumeEngine();
    spawnWorld();
  }
}