import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameJoystick extends JoystickComponent {
  GameJoystick():super(
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
}