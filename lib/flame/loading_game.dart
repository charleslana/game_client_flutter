import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/loading_component.dart';

class LoadingGame extends FlameGame {
  LoadingGame({required this.screenSize});

  final Size screenSize;

  LoadingComponent? _loadingComponent;

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    _loadingComponent = LoadingComponent(screenSize: screenSize);
    await add(_loadingComponent!);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _loadingComponent?.calculateScale(screenSize);
    super.update(dt);
  }
}
