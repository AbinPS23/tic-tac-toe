import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
   const ScoreBoard({super.key});
   final _scoreBoardStyle = const TextStyle(color: Colors.white,fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _players(player: "Player 1", score: 3),
            _players(player: "Player 2", score: 5)
          ],
        );
  }
  _players({required player,required score}){
    return Column(
              children: [
                Text(player,style: _scoreBoardStyle,),
                Text(score.toString(),style: _scoreBoardStyle,),
              ],
            );
  }
}