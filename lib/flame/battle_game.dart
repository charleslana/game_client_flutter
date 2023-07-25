import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/battle_background_component.dart';
import 'components/model_component.dart';

class BattleGame extends FlameGame {
  BattleGame(this.context);

  final BuildContext context;

  @override
  Color backgroundColor() => Colors.white;

  @override
  FutureOr<void> onLoad() async {
    await add(BattleBackgroundComponent());
    await add(ModelComponent());
    return super.onLoad();
  }
}
