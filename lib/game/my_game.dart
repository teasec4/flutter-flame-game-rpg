import 'dart:math';
import 'dart:ui';
import 'package:firstgame/levels/level.dart';
import 'package:firstgame/ui/joystick.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../components/player.dart';
import '../components/enemy.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late Player? player;
  final List<Component> _worldComponents = [];
  final world = Level();


  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera = CameraComponent.withFixedResolution(
      width: 640,
      height: 320,
      world: world,
    );
    camera.viewfinder.anchor = Anchor.topLeft;
    addAll([camera, world]);

    spawnWorld();
  }

  void spawnWorld(){
    // create a Joystick
    final joystick = GameJoystick();
    camera.viewport.add(joystick);
    _worldComponents.add(joystick);

    // create player
    player = Player(joystick, key: ComponentKey.named('player'))
      ..position = Vector2(320, 180)
    ..priority = 1 ;
    world.add(player!);
    _worldComponents.add(player!);

    // spawn 3 enemy in random place
    final int enemyCount = 3;
    final random = Random();
    for (int i = 0; i < enemyCount; i++){
      final enemy = Enemy()
          ..position = Vector2(
              random.nextInt(540) + 50,
              random.nextInt(260) + 50
          )
      ..priority = 1;
      world.add(enemy);
      _worldComponents.add(enemy);
    }
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