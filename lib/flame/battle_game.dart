import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../data/battle_data.dart';
import '../data/character_data.dart';
import '../data/character_position_data.dart';
import '../enum/character_turn_enum.dart';
import '../model/battle_report_model.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';
import 'components/area_component.dart';
import 'components/battle_background_component.dart';
import 'components/character_component.dart';
import 'components/character_position_component.dart';
import 'components/model_component.dart';
import 'models/character_flame_model.dart';

class BattleGame extends FlameGame {
  BattleGame(this.context);

  final BuildContext context;

  late CharacterComponent _friend1;
  late CharacterComponent _friend2;
  late CharacterComponent _friend3;
  late CharacterComponent _friend4;
  late CharacterComponent _friend5;
  late CharacterComponent _friend6;

  late CharacterComponent _enemy1;
  late CharacterComponent _enemy2;
  late CharacterComponent _enemy3;
  late CharacterComponent _enemy4;
  late CharacterComponent _enemy5;
  late CharacterComponent _enemy6;

  late CharacterPositionComponent _friendPosition1;
  late CharacterPositionComponent _friendPosition2;
  late CharacterPositionComponent _friendPosition3;
  late CharacterPositionComponent _friendPosition4;
  late CharacterPositionComponent _friendPosition5;
  late CharacterPositionComponent _friendPosition6;

  late CharacterPositionComponent _friendMagicPosition1;
  late CharacterPositionComponent _friendMagicPosition2;
  late CharacterPositionComponent _friendMagicPosition3;
  late CharacterPositionComponent _friendMagicPosition4;
  late CharacterPositionComponent _friendMagicPosition5;
  late CharacterPositionComponent _friendMagicPosition6;

  late CharacterPositionComponent _enemyPosition1;
  late CharacterPositionComponent _enemyPosition2;
  late CharacterPositionComponent _enemyPosition3;
  late CharacterPositionComponent _enemyPosition4;
  late CharacterPositionComponent _enemyPosition5;
  late CharacterPositionComponent _enemyPosition6;

  late CharacterPositionComponent _enemyMagicPosition1;
  late CharacterPositionComponent _enemyMagicPosition2;
  late CharacterPositionComponent _enemyMagicPosition3;
  late CharacterPositionComponent _enemyMagicPosition4;
  late CharacterPositionComponent _enemyMagicPosition5;
  late CharacterPositionComponent _enemyMagicPosition6;

  late AreaComponent _friendAreaComponent;
  late AreaComponent _enemyAreaComponent;

  double moveForwardDuration = 0.5 - 0.0;
  double moveBackDuration = 0.5 - 0.0;
  int moveWaitDuration = 0;

  @override
  Color backgroundColor() => Colors.white;

  @override
  FutureOr<void> onLoad() async {
    await add(BattleBackgroundComponent());
    await add(ModelComponent());
    _addCharacters();
    await _mountBattle();
    Future.delayed(const Duration(milliseconds: 500), () async {
      await _init();
    });
    return super.onLoad();
  }

  void _addCharacters() {
    _friend1 = CharacterComponent(character: character1);
    _friend2 = CharacterComponent(character: character1);
    _friend3 = CharacterComponent(character: character1);
    _friend4 = CharacterComponent(character: character1);
    _friend5 = CharacterComponent(character: character1);
    _friend6 = CharacterComponent(character: character1);

    _enemy1 = CharacterComponent(character: character1, isFlip: true);
    _enemy2 = CharacterComponent(character: character1, isFlip: true);
    _enemy3 = CharacterComponent(character: character1, isFlip: true);
    _enemy4 = CharacterComponent(character: character1, isFlip: true);
    _enemy5 = CharacterComponent(character: character1, isFlip: true);
    _enemy6 = CharacterComponent(character: character1, isFlip: true);

    _friendPosition1 = CharacterPositionComponent(
      character: _friend1,
      positionX: positionAllyX1,
      positionY: positionAllyY1,
      priorityCharacter: 1,
    );

    _friendPosition2 = CharacterPositionComponent(
      character: _friend2,
      positionX: positionAllyX2,
      positionY: positionAllyY2,
      priorityCharacter: 2,
    );

    _friendPosition3 = CharacterPositionComponent(
      character: _friend3,
      positionX: positionAllyX3,
      positionY: positionAllyY3,
      priorityCharacter: 3,
    );

    _friendPosition4 = CharacterPositionComponent(
      character: _friend4,
      positionX: positionAllyX4,
      positionY: positionAllyY4,
      priorityCharacter: 4,
    );

    _friendPosition5 = CharacterPositionComponent(
      character: _friend5,
      positionX: positionAllyX5,
      positionY: positionAllyY5,
      priorityCharacter: 5,
    );

    _friendPosition6 = CharacterPositionComponent(
      character: _friend6,
      positionX: positionAllyX6,
      positionY: positionAllyY6,
      priorityCharacter: 6,
    );

    _enemyPosition1 = CharacterPositionComponent(
      character: _enemy1,
      positionX: positionEnemyX1,
      positionY: positionEnemyY1,
      priorityCharacter: 1,
    );

    _enemyPosition2 = CharacterPositionComponent(
      character: _enemy2,
      positionX: positionEnemyX2,
      positionY: positionEnemyY2,
      priorityCharacter: 2,
    );

    _enemyPosition3 = CharacterPositionComponent(
      character: _enemy3,
      positionX: positionEnemyX3,
      positionY: positionEnemyY3,
      priorityCharacter: 3,
    );

    _enemyPosition4 = CharacterPositionComponent(
      character: _enemy4,
      positionX: positionEnemyX4,
      positionY: positionEnemyY4,
      priorityCharacter: 4,
    );

    _enemyPosition5 = CharacterPositionComponent(
      character: _enemy5,
      positionX: positionEnemyX5,
      positionY: positionEnemyY5,
      priorityCharacter: 5,
    );

    _enemyPosition6 = CharacterPositionComponent(
      character: _enemy6,
      positionX: positionEnemyX6,
      positionY: positionEnemyY6,
      priorityCharacter: 6,
    );

    _friendMagicPosition1 = _friendPosition1.copyWith();
    _friendMagicPosition2 = _friendPosition2.copyWith();
    _friendMagicPosition3 = _friendPosition3.copyWith();
    _friendMagicPosition4 = _friendPosition4.copyWith();
    _friendMagicPosition5 = _friendPosition5.copyWith();
    _friendMagicPosition6 = _friendPosition6.copyWith();

    _enemyMagicPosition1 = _enemyPosition1.copyWith();
    _enemyMagicPosition2 = _enemyPosition2.copyWith();
    _enemyMagicPosition3 = _enemyPosition3.copyWith();
    _enemyMagicPosition4 = _enemyPosition4.copyWith();
    _enemyMagicPosition5 = _enemyPosition5.copyWith();
    _enemyMagicPosition6 = _enemyPosition6.copyWith();

    final area = _friend1.copyWith(character: character3);
    _friendAreaComponent = AreaComponent(
      character: area.character,
      isFlip: true,
    );
    _enemyAreaComponent = AreaComponent(character: area.character);
  }

  Future<void> _mountBattle() async {
    await _mountFriends();
    await _mountEnemies();
  }

  Future<void> _mountFriends() async {
    _getReport().friendCharacters.asMap().forEach((index, uc) async {
      if (index == 0) {
        _friend1 = _friend1.copyWith(character: getCharacter(uc.character));
        _friendPosition1 = _friendPosition1.copyWith(character: _friend1);
        await add(_friendPosition1);
        if (_friendPosition1.character.character.magic != null) {
          final magic = _friend1.copyWith();
          _friendMagicPosition1 =
              _friendMagicPosition1.copyWith(character: magic);
          await add(_friendMagicPosition1);
          await _friendMagicPosition1.character
              .setMagicAnimation(_friendMagicPosition1.size);
          await _friendMagicPosition1.hideCharacter();
        }
      }
      if (index == 1) {
        _friend2 = _friend2.copyWith(character: getCharacter(uc.character));
        _friendPosition2 = _friendPosition2.copyWith(character: _friend2);
        await add(_friendPosition2);
        if (_friendPosition2.character.character.magic != null) {
          final magic = _friend2.copyWith();
          _friendMagicPosition2 =
              _friendMagicPosition2.copyWith(character: magic);
          await add(_friendMagicPosition2);
          await _friendMagicPosition2.character
              .setMagicAnimation(_friendMagicPosition2.size);
          await _friendMagicPosition2.hideCharacter();
        }
      }
      if (index == 2) {
        _friend3 = _friend3.copyWith(character: getCharacter(uc.character));
        _friendPosition3 = _friendPosition3.copyWith(character: _friend3);
        await add(_friendPosition3);
        if (_friendPosition3.character.character.magic != null) {
          final magic = _friend3.copyWith();
          _friendMagicPosition3 =
              _friendMagicPosition3.copyWith(character: magic);
          await add(_friendMagicPosition3);
          await _friendMagicPosition3.character
              .setMagicAnimation(_friendMagicPosition3.size);
          await _friendMagicPosition3.hideCharacter();
        }
      }
      if (index == 3) {
        _friend4 = _friend4.copyWith(character: getCharacter(uc.character));
        _friendPosition4 = _friendPosition4.copyWith(character: _friend4);
        await add(_friendPosition4);
        if (_friendPosition4.character.character.magic != null) {
          final magic = _friend4.copyWith();
          _friendMagicPosition4 =
              _friendMagicPosition4.copyWith(character: magic);
          await add(_friendMagicPosition4);
          await _friendMagicPosition4.character
              .setMagicAnimation(_friendMagicPosition4.size);
          await _friendMagicPosition4.hideCharacter();
        }
      }
      if (index == 4) {
        _friend5 = _friend5.copyWith(character: getCharacter(uc.character));
        _friendPosition5 = _friendPosition5.copyWith(character: _friend5);
        await add(_friendPosition5);
        if (_friendPosition5.character.character.magic != null) {
          final magic = _friend5.copyWith();
          _friendMagicPosition5 =
              _friendMagicPosition5.copyWith(character: magic);
          await add(_friendMagicPosition5);
          await _friendMagicPosition5.character
              .setMagicAnimation(_friendMagicPosition5.size);
          await _friendMagicPosition5.hideCharacter();
        }
      }
      if (index == 5) {
        _friend6 = _friend6.copyWith(character: getCharacter(uc.character));
        _friendPosition6 = _friendPosition6.copyWith(character: _friend6);
        await add(_friendPosition6);
        if (_friendPosition6.character.character.magic != null) {
          final magic = _friend6.copyWith();
          _friendMagicPosition6 =
              _friendMagicPosition6.copyWith(character: magic);
          await add(_friendMagicPosition6);
          await _friendMagicPosition6.character
              .setMagicAnimation(_friendMagicPosition6.size);
          await _friendMagicPosition6.hideCharacter();
        }
      }
    });
  }

  Future<void> _mountEnemies() async {
    _getReport().enemyCharacters.asMap().forEach((index, uc) async {
      if (index == 0) {
        _enemy1 = _enemy1.copyWith(character: getCharacter(uc.character));
        _enemyPosition1 = _enemyPosition1.copyWith(character: _enemy1);
        await add(_enemyPosition1);
        if (_enemyPosition1.character.character.magic != null) {
          final magic = _enemy1.copyWith();
          _enemyMagicPosition1 =
              _enemyMagicPosition1.copyWith(character: magic);
          await add(_enemyMagicPosition1);
          await _enemyMagicPosition1.character
              .setMagicAnimation(_enemyMagicPosition1.size);
          await _enemyMagicPosition1.hideCharacter();
        }
      }
      if (index == 1) {
        _enemy2 = _enemy2.copyWith(character: getCharacter(uc.character));
        _enemyPosition2 = _enemyPosition2.copyWith(character: _enemy2);
        await add(_enemyPosition2);
        if (_enemyPosition2.character.character.magic != null) {
          final magic = _enemy2.copyWith();
          _enemyMagicPosition2 =
              _enemyMagicPosition2.copyWith(character: magic);
          await add(_enemyMagicPosition2);
          await _enemyMagicPosition2.character
              .setMagicAnimation(_enemyMagicPosition2.size);
          await _enemyMagicPosition2.hideCharacter();
        }
      }
      if (index == 2) {
        _enemy3 = _enemy3.copyWith(character: getCharacter(uc.character));
        _enemyPosition3 = _enemyPosition3.copyWith(character: _enemy3);
        await add(_enemyPosition3);
        if (_enemyPosition3.character.character.magic != null) {
          final magic = _enemy3.copyWith();
          _enemyMagicPosition3 =
              _enemyMagicPosition3.copyWith(character: magic);
          await add(_enemyMagicPosition3);
          await _enemyMagicPosition3.character
              .setMagicAnimation(_enemyMagicPosition3.size);
          await _enemyMagicPosition3.hideCharacter();
        }
      }
      if (index == 3) {
        _enemy4 = _enemy4.copyWith(character: getCharacter(uc.character));
        _enemyPosition4 = _enemyPosition4.copyWith(character: _enemy4);
        await add(_enemyPosition4);
        if (_enemyPosition4.character.character.magic != null) {
          final magic = _enemy4.copyWith();
          _enemyMagicPosition4 =
              _enemyMagicPosition4.copyWith(character: magic);
          await add(_enemyMagicPosition4);
          await _enemyMagicPosition4.character
              .setMagicAnimation(_enemyMagicPosition4.size);
          await _enemyMagicPosition4.hideCharacter();
        }
      }
      if (index == 4) {
        _enemy5 = _enemy5.copyWith(character: getCharacter(uc.character));
        _enemyPosition5 = _enemyPosition5.copyWith(character: _enemy5);
        await add(_enemyPosition5);
        if (_enemyPosition5.character.character.magic != null) {
          final magic = _enemy5.copyWith();
          _enemyMagicPosition5 =
              _enemyMagicPosition5.copyWith(character: magic);
          await add(_enemyMagicPosition5);
          await _enemyMagicPosition5.character
              .setMagicAnimation(_enemyMagicPosition5.size);
          await _enemyMagicPosition5.hideCharacter();
        }
      }
      if (index == 5) {
        _enemy6 = _enemy6.copyWith(character: getCharacter(uc.character));
        _enemyPosition6 = _enemyPosition6.copyWith(character: _enemy6);
        await add(_enemyPosition6);
        if (_enemyPosition6.character.character.magic != null) {
          final magic = _enemy6.copyWith();
          _enemyMagicPosition6 =
              _enemyMagicPosition6.copyWith(character: magic);
          await add(_enemyMagicPosition6);
          await _enemyMagicPosition6.character
              .setMagicAnimation(_enemyMagicPosition6.size);
          await _enemyMagicPosition6.hideCharacter();
        }
      }
    });
  }

  BattleReportModel _getReport() {
    return battleReport;
  }

  Future<void> _init() async {
    final reports = _getReport().reports;
    int hitTime = 0;
    await Future.forEach(reports, (report) async {
      final source = _getTurn(report);
      var target = _getEnemyPosition(report.enemyPosition);
      if (report.turn == CharacterTurnEnum.enemy) {
        target = _getFriendPosition(report.friendPosition);
      }
      await Future.delayed(Duration(milliseconds: hitTime), () async {
        hitTime = await _validateSource(source, target, report);
      });
    });
    await Future.delayed(Duration(milliseconds: hitTime), () async {
      await _showFinishDialog();
    });
  }

  Future<int> _validateSource(CharacterPositionComponent source,
      CharacterPositionComponent target, ReportModel report) async {
    if (source.character.character.run != null) {
      final hitTime = await _runCharacter(source, target, report);
      return (moveForwardDuration * 1000).toInt() +
          (source.character.character.attack.hitTime! * 1000).toInt() +
          hitTime +
          (moveBackDuration * 1000).toInt();
    }
    if (source.character.character.magic != null) {
      final hitTime = await _magicCharacter(source, target, report);
      return (moveForwardDuration * 1000).toInt() +
          (source.character.character.magic!.hitTime! * 1000).toInt() +
          hitTime +
          600;
    }
    if (source.character.character.area != null) {
      final hitTime = await _areaCharacter(source, target, report);
      return (source.character.character.area!.hitTime! * 1000).toInt() +
          hitTime;
    }
    return 0;
  }

  CharacterPositionComponent _getTurn(ReportModel report) {
    if (report.turn == CharacterTurnEnum.friend) {
      return _getFriendPosition(report.friendPosition);
    }
    return _getEnemyPosition(report.enemyPosition);
  }

  CharacterPositionComponent _getMagicTurn(ReportModel report) {
    if (report.turn == CharacterTurnEnum.friend) {
      return _getFriendMagicPosition(report.friendPosition);
    }
    return _getEnemyMagicPosition(report.enemyPosition);
  }

  AreaComponent _getAreaTurn(
      ReportModel report, CharacterFlameModel character) {
    if (report.turn == CharacterTurnEnum.friend) {
      return _friendAreaComponent.copyWith(character: character);
    }
    return _enemyAreaComponent.copyWith(character: character);
  }

  CharacterPositionComponent _getFriendPosition(int position) {
    switch (position) {
      case 1:
        return _friendPosition1;
      case 2:
        return _friendPosition2;
      case 3:
        return _friendPosition3;
      case 4:
        return _friendPosition4;
      case 5:
        return _friendPosition5;
      case 6:
        return _friendPosition6;
      default:
        return _friendPosition1;
    }
  }

  CharacterPositionComponent _getFriendMagicPosition(int position) {
    switch (position) {
      case 1:
        return _friendMagicPosition1;
      case 2:
        return _friendMagicPosition2;
      case 3:
        return _friendMagicPosition3;
      case 4:
        return _friendMagicPosition4;
      case 5:
        return _friendMagicPosition5;
      case 6:
        return _friendMagicPosition6;
      default:
        return _friendMagicPosition1;
    }
  }

  CharacterPositionComponent _getEnemyPosition(int position) {
    switch (position) {
      case 1:
        return _enemyPosition1;
      case 2:
        return _enemyPosition2;
      case 3:
        return _enemyPosition3;
      case 4:
        return _enemyPosition4;
      case 5:
        return _enemyPosition5;
      case 6:
        return _enemyPosition6;
      default:
        return _enemyPosition1;
    }
  }

  CharacterPositionComponent _getEnemyMagicPosition(int position) {
    switch (position) {
      case 1:
        return _enemyMagicPosition1;
      case 2:
        return _enemyMagicPosition2;
      case 3:
        return _enemyMagicPosition3;
      case 4:
        return _enemyMagicPosition4;
      case 5:
        return _enemyMagicPosition5;
      case 6:
        return _enemyMagicPosition6;
      default:
        return _enemyMagicPosition1;
    }
  }

  Future<void> _showFinishDialog() async {
    await showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              'Vitória'.toUpperCase(),
              textAlign: TextAlign.center,
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Prêmios da batalha 1'),
                Text('Prêmios da batalha 2'),
              ],
            ),
            actions: [
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  popUntil(context);
                  pushReplacementNamed(context, homeRoute);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<int> _areaCharacter(CharacterPositionComponent source,
      CharacterPositionComponent target, ReportModel report) async {
    final friendPosition = source;
    final enemyPosition = target;
    friendPosition.hideHit();
    final attackAnimation = await friendPosition.character.setAttackAnimation();
    int hitTime = 0;
    attackAnimation.animationTicker?.onComplete = () async {
      await friendPosition.character.setIdleAnimation();
      final areaComponent =
          _getAreaTurn(report, friendPosition.character.character);
      await add(areaComponent);
      final areaAnimation = await areaComponent.setAreaAnimation();
      areaAnimation.animationTicker?.onComplete = () async {
        await areaComponent.hide();
        int defenseTime = 0;
        if (report.hpDefense != null) {
          await enemyPosition.character.setDamageColor();
          await enemyPosition.character.setDefenseAnimation();
          defenseTime = enemyPosition.character.character.defense.amount *
              (enemyPosition.character.character.defense.stepTime * 1000)
                  .toInt();
        }
        await Future.delayed(
            Duration(milliseconds: defenseTime - moveWaitDuration), () async {
          hitTime = await _handleEnemyHit(enemyPosition, report);
        });
      };
    };
    return hitTime;
  }

  Future<int> _magicCharacter(CharacterPositionComponent source,
      CharacterPositionComponent target, ReportModel report) async {
    int hitTime = 0;
    final friendPosition = source;
    final enemyPosition = target;
    final magicPosition = _getMagicTurn(report);
    friendPosition.hideHit();
    final attackAnimation = await friendPosition.character.setAttackAnimation();
    int defenseTime = 0;
    if (report.hpDefense != null) {
      defenseTime = enemyPosition.character.character.defense.amount *
          (enemyPosition.character.character.defense.stepTime * 1000).toInt();
    }
    attackAnimation.animationTicker?.onComplete = () async {
      magicPosition.priority = 7;
      await magicPosition.showCharacter();
      await magicPosition.add(MoveToEffect(
        enemyPosition.getStartingPosition(),
        EffectController(duration: moveForwardDuration),
      )..onComplete = () async {
          if (report.hpDefense != null) {
            await enemyPosition.character.setDamageColor();
            await enemyPosition.character.setDefenseAnimation();
          }
          await Future.delayed(
              Duration(milliseconds: defenseTime - moveWaitDuration), () async {
            await friendPosition.character.setIdleAnimation();
            hitTime = await _handleEnemyHit(enemyPosition, report);
            await enemyPosition.character.setIdleAnimation();
            await magicPosition.hideCharacter();
            magicPosition.priority = magicPosition.priorityCharacter;
            if (report.furyAttack != null) {
              friendPosition.emptyFuryBarComponent
                  .changeSize(report.furyAttack!);
            }
            await magicPosition.add(MoveToEffect(
              magicPosition.getStartingPosition(),
              EffectController(duration: 0),
            ));
          });
        });
    };
    return hitTime + defenseTime;
  }

  Future<int> _runCharacter(CharacterPositionComponent source,
      CharacterPositionComponent target, ReportModel report) async {
    int hitTime = 0;
    final friendPosition = source;
    final enemyPosition = target;
    friendPosition
      ..hideHit()
      ..priority = 7;
    await friendPosition.hideAll();
    await friendPosition.character.setRunningAnimation();
    await friendPosition.add(
      MoveToEffect(
        enemyPosition.getStartingPosition(),
        EffectController(duration: moveForwardDuration),
      )..onComplete = () async {
          await friendPosition.character.setAttackAnimation();
          if (report.hpDefense != null) {
            await enemyPosition.character.setDefenseAnimation();
            await enemyPosition.character.setDamageColor();
          }
          await Future.delayed(
              Duration(
                  milliseconds: friendPosition.character.getWaitHit() -
                      moveWaitDuration), () async {
            hitTime = await _handleEnemyHit(enemyPosition, report);
            await friendPosition.character.setRunningAnimation();
            await _moveStartingPosition(friendPosition, report);
          });
        },
    );
    return hitTime;
  }

  Future<int> _handleEnemyHit(
      CharacterPositionComponent enemyPosition, ReportModel report) async {
    int defenseTime = 0;
    if (report.hpDefense != null) {
      await enemyPosition.emptyHpBarComponent.changeSize(report.hpDefense!);
      if (report.critical == true) {
        await enemyPosition.criticalTextComponent.show();
      }
      await enemyPosition.damageComponent.show(report.damage!);
      defenseTime =
          (enemyPosition.character.character.defense.hitTime! * 1000).toInt();
    } else {
      await enemyPosition.dodgeTextComponent.show();
    }
    if (report.death == true) {
      await enemyPosition.character.setDeathAnimation();
      await enemyPosition.hideAll();
    } else {
      await enemyPosition.character.setIdleAnimation();
      if (report.furyDefense != null) {
        enemyPosition.emptyFuryBarComponent.changeSize(report.furyDefense!);
      }
    }
    return defenseTime;
  }

  Future<void> _moveStartingPosition(
      CharacterPositionComponent characterPosition, ReportModel report) async {
    Anchor anchor = characterPosition.character.anchor;
    if (anchor == Anchor.bottomLeft) {
      anchor = Anchor.bottomRight;
    } else {
      anchor = Anchor.bottomLeft;
    }
    characterPosition.character.flipHorizontally();
    await characterPosition.add(
      MoveToEffect(
        characterPosition.getStartingPosition(),
        EffectController(duration: moveBackDuration),
      )..onComplete = () async {
          characterPosition.priority = characterPosition.priorityCharacter;
          if (anchor == Anchor.bottomLeft) {
            anchor = Anchor.bottomRight;
          } else {
            anchor = Anchor.bottomLeft;
          }
          characterPosition.character.flipHorizontally();
          await characterPosition.character.setIdleAnimation();
          await characterPosition.showAll();
          if (report.furyAttack != null) {
            characterPosition.emptyFuryBarComponent
                .changeSize(report.furyAttack!);
          }
        },
    );
  }
}
