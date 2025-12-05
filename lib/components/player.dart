import 'package:firstgame/components/enemy.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import '../game/my_game.dart';

class Player extends PositionComponent with CollisionCallbacks, HasGameReference<MyGame> {
  final JoystickComponent joystick;
  final double speed = 80;

  Player(this.joystick, {ComponentKey? key}) : super(key:key){
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
    final paint = Paint()..color = Colors.green;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    final delta = joystick.relativeDelta;
    if (!delta.isZero()) {
      position += Vector2(delta.x, delta.y) * speed * dt;
    }
    position.x = position.x.clamp(0, game.size.x - size.x);
    position.y = position.y.clamp(0, game.size.y - size.y);
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is Enemy) {
      removeFromParent();
      game.onPlayerDied();
    }
  }
}