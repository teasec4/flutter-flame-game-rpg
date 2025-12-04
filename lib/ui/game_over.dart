import 'package:firstgame/game/my_game.dart';
import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {
  final MyGame game;
  const GameOverOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'You Died',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.restart();
              game.overlays.remove('GameOver');
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
