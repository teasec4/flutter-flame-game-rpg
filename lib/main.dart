import 'package:firstgame/game/my_game.dart';
import 'package:firstgame/ui/game_over.dart';
import 'package:flame/camera.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  MyGame game = MyGame();


  runApp(GameWidget(
      game: game,
    overlayBuilderMap: {
        'GameOver' : (ctx, game) => GameOverOverlay(game as MyGame),
    },
  ));
}

