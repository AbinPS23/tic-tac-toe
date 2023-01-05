import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/view/widgets/game.dart';
import 'package:tic_tac_toe_game/view/widgets/scoreBoard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade800,body: Column(
      children:  [
        const Expanded(child: ScoreBoard()),
        Expanded(flex:3,child: Game())
      ],
    ),);
  }
}