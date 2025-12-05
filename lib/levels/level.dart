import 'dart:async';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World{
  late TiledComponent level;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    final level = await TiledComponent.load('level-01.tmx', Vector2.all(32));
    level.priority = 0;
    add(level);
  }
}