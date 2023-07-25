import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../flame/battle_game.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GameWidget<BattleGame>(
        game: BattleGame(context),
        loadingBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
