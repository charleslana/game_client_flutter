import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../../routes/app_routes.dart';
import '../../utils/utils.dart';
import '../battle_game.dart';

class ModelComponent extends PositionComponent
    with HasGameRef<BattleGame>, TapCallbacks {
  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    size = Vector2.all(88);
    position =
        Vector2(gameRef.size.x - gameRef.size.y / 6, gameRef.size.y / 25);
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    pushReplacementNamed(gameRef.context, homeRoute);
    super.onTapUp(event);
  }
}
