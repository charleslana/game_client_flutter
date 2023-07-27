import '../enum/character_turn_enum.dart';
import 'user_character_model.dart';

class BattleReportModel {
  BattleReportModel({
    required this.friendCharacters,
    required this.enemyCharacters,
    required this.reports,
    required this.win,
  });

  final List<UserCharacterModel> friendCharacters;
  final List<UserCharacterModel> enemyCharacters;
  final List<ReportModel> reports;
  final bool win;
}

class ReportModel {
  ReportModel({
    required this.turnQuantity,
    required this.turn,
    required this.friendPosition,
    required this.enemyPosition,
    this.hpDefense,
    this.damage,
    this.furyDefense,
    this.furyAttack,
    this.death,
    this.critical,
    this.dodge,
  });

  final int turnQuantity;
  final CharacterTurnEnum turn;
  final int friendPosition;
  final int enemyPosition;
  final int? hpDefense;
  final int? damage;
  final int? furyDefense;
  final int? furyAttack;
  final bool? death;
  final bool? critical;
  final bool? dodge;
}
