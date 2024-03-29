import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../battle_game.dart';
import 'character_component.dart';
import 'damage_component.dart';
import 'empty_fury_bar_component.dart';
import 'empty_hp_bar_component.dart';
import 'hit_text_component.dart';
import 'shadow_component.dart';

class CharacterPositionComponent extends PositionComponent
    with HasGameRef<BattleGame> {
  CharacterPositionComponent({
    required this.character,
    required this.positionX,
    required this.positionY,
    required this.priorityCharacter,
  });

  final CharacterComponent character;
  final double positionX;
  final double positionY;
  final int priorityCharacter;

  CharacterPositionComponent copyWith({
    CharacterComponent? character,
    double? positionX,
    double? positionY,
    int? priorityCharacter,
  }) {
    return CharacterPositionComponent(
      character: character ?? this.character,
      positionX: positionX ?? this.positionX,
      positionY: positionY ?? this.positionY,
      priorityCharacter: priorityCharacter ?? this.priorityCharacter,
    );
  }

  late EmptyHpBarComponent emptyHpBarComponent;
  late EmptyFuryBarComponent emptyFuryBarComponent;
  late DamageComponent damageComponent;
  late ShadowComponent shadowComponent;
  late HitTextComponent criticalTextComponent;
  late HitTextComponent dodgeTextComponent;

  late Vector2 _starterPosition;

  @override
  Future<void> onLoad() async {
    debugMode = false;

    size = Vector2.all(gameRef.size.y * 20 / 100);

    priority = priorityCharacter;

    final initPosition = Vector2(
        gameRef.size.x * positionX / 100, gameRef.size.y * positionY / 100);

    position = initPosition;

    _starterPosition = initPosition;

    shadowComponent = ShadowComponent(
      characterPositionSize: size,
      characterScale: character.character.scale,
    );
    await add(shadowComponent);

    await add(character);

    emptyHpBarComponent = EmptyHpBarComponent(
      characterPositionSize: size,
      characterScale: character.character.scale,
      isFlip: character.isFlip,
    );
    await add(emptyHpBarComponent);

    emptyFuryBarComponent = EmptyFuryBarComponent(
      characterPositionSize: size,
      characterScale: character.character.scale,
      isFlip: character.isFlip,
    );
    await add(emptyFuryBarComponent);

    criticalTextComponent = HitTextComponent(
      characterPositionSize: size,
      hitText: 'Crítico',
      color: Colors.orange,
    );
    await add(criticalTextComponent);

    dodgeTextComponent = HitTextComponent(
      characterPositionSize: size,
      hitText: 'Esquivou',
      color: Colors.grey,
    );
    await add(dodgeTextComponent);

    damageComponent = DamageComponent(characterPositionSize: size);
    await add(damageComponent);

    return super.onLoad();
  }

  Vector2 getStartingPosition() {
    return _starterPosition;
  }

  Future<void> hideAll() async {
    await emptyHpBarComponent.hide();
    await shadowComponent.hide();
    await emptyFuryBarComponent.hide();
  }

  Future<void> showAll() async {
    await emptyHpBarComponent.show();
    await shadowComponent.show();
    await emptyFuryBarComponent.show();
  }

  void hideHit() {
    damageComponent.hide();
    criticalTextComponent.hide();
    dodgeTextComponent.hide();
  }

  Future<void> hideCharacter() async {
    await hideAll();
    await character.hide();
  }

  Future<void> showCharacter() async {
    await character.show();
  }
}
