import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class Enemy extends PositionComponent with CollisionCallbacks {
  double speed = 100;
  bool movingRight = true;

  Enemy(){
    size = Vector2.all(50);
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
      if (position.x > 700) movingRight = false;
    } else {
      position.x -= speed * dt;
      if (position.x < 100) movingRight = true;
    }
  }

}