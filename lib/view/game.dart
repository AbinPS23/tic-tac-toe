import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget {
  const Game({super.key});
  @override
  State<Game> createState() => _GameState();
}
class _GameState extends State<Game> {
   final _scoreBoardTextStyle =  const TextStyle(color: Colors.white,fontSize: 25,letterSpacing: 2);
    _winnerDialogTextStyle([color=Colors.white]) {return GoogleFonts.odibeeSans(textStyle:  TextStyle(color: color,fontSize: 20,letterSpacing: 1.5));}
  bool _ohTurn = true; //*player 1 is 'O'
  int _filledBox = 0;
  int _ohScore = 0;
   int _exScore = 0;
  List<String> displayExOh = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: [
         const SizedBox(height: 10,),
          Expanded(child: scoreBoard()),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style:  GoogleFonts.odibeeSans(textStyle: const TextStyle(color: Colors.white, fontSize: 45,letterSpacing: 3)),
                      ),
                    ),
                  ),
                  onTap: () => _tapped(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//Scoreboard
scoreBoard(){
 return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _players(player: "Player 1", score: _ohScore),
            _players(player: "Player 2", score: _exScore)
          ],
        );
}
//players
 _players({required player,required score}){
    return Column(
              children: [
                Text(player,style: GoogleFonts.odibeeSans(textStyle:_scoreBoardTextStyle),),
                Divider(color: Colors.grey.shade500,),
                Text(score.toString(),style: _scoreBoardTextStyle,),
              ],
            );
  }
//game ontap
  _tapped(index) {
    setState(() {
      if (_ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "O";
        _ohTurn = !_ohTurn;
        _filledBox += 1;
      } else if (!_ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "X";
        _ohTurn = !_ohTurn;
        _filledBox += 1;
      }
      _checkWinner();
    });
  }

  _checkWinner() {
    //1st row condititon
    _winnerCondition();
    
  }

  _showWinnerDialog([String? winner]) {

    setState(() {
      ( winner == "O")?_ohScore++:_exScore++;
    });
    showDialog(
      
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        
        title: winner != null
            ? Center(child: Text(winner != "O" ? "Winner is Player 2" : "Winner is Player 1",style: _winnerDialogTextStyle(),))
            :  Center(child: Text("Game Draw!!",style: _winnerDialogTextStyle(),)),
          actions: [
            Center(
              child: TextButton(onPressed: () {
                _resetGame();
                Navigator.pop(context);
              }, child:  Text("Play Again",style: _winnerDialogTextStyle(Colors.tealAccent.shade100),)),
            )
          ],
      ),
    );
  }

  _winnerCondition() {
    //*1st row condtition
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      _showWinnerDialog(displayExOh[0]);
    }
     //*2nd row condtition
   else if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      _showWinnerDialog(displayExOh[3]);
    }
     //*3rd row condtition
   else if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      _showWinnerDialog(displayExOh[6]);
    }
    //*1st column condtition
   else if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      _showWinnerDialog(displayExOh[0]);
    }
     //*2nd column condtition
   else if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      _showWinnerDialog(displayExOh[1]);
    }
     //*3rd column condtition
   else if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      _showWinnerDialog(displayExOh[2]);
    }
     //*diagonal condtition
   else if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      _showWinnerDialog(displayExOh[0]);
    }
    //*diagonal condtition
   else if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != "") {
      _showWinnerDialog(displayExOh[6]);
    }
    else if(_filledBox == 9){
      _showWinnerDialog();
    }
  }

  _resetGame(){
    for(int i=0;i<9;i++){
   setState(() {
      
      displayExOh[i] = "";
    
   });}
_filledBox = 0;
_ohTurn = true;
  }

}
