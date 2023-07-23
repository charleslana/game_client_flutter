import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_client/data/image_data.dart';

class LoadingComponent extends PositionComponent {
  LoadingComponent({required this.screenSize});

  final Size screenSize;

  SpriteAnimationComponent _spriteAnimationComponent =
      SpriteAnimationComponent();

  @override
  Future<void>? onLoad() async {
    final spriteSheet = await Images(prefix: '').load(
      loadingAnimated,
    );
    final SpriteAnimationData spriteAnimationData =
        SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(44, 23),
    );
    _spriteAnimationComponent = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);
    calculateScale(screenSize);
    await add(_spriteAnimationComponent);
    return super.onLoad();
  }

  void calculateScale(Size screenSize) {
    final double scaleWidthFactor = screenSize.width / 44 / 5;
    final double scaleHeightFactor = screenSize.height / 23 / 5;
    _spriteAnimationComponent.scale =
        Vector2(scaleWidthFactor, scaleHeightFactor);
  }
}
