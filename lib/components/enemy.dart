import 'dart:ui';

import 'package:firstgame/game/my_game.dart';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class Enemy extends PositionComponent with CollisionCallbacks, HasGameReference<MyGame> {
  double speed = 50;
  bool movingRight = true;
  bool movingDown = true;

  Enemy(){
    size = Vector2.all(25);
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    final pain = Paint()..color = Colors.red;
    canvas.drawRect(size.toRect(), pain);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (movingRight) {
      position.x += speed * dt;
      if (position.x >= game.size.x - size.x) movingRight = false;
    } else {
      position.x -= speed * dt;
      if (position.x <= size.x) movingRight = true;
    }

    position.x = position.x.clamp(0, game.size.x - size.x);
    position.y = position.y.clamp(0, game.size.y - size.y);
  }

}