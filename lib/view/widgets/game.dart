import 'package:flutter/material.dart';

class Game extends StatelessWidget {
   Game({super.key});
   String displayExOh = "";

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade700),),
            child: Center(
              child: Text(
                displayExOh,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
          onTap:() => _tapped(index),
        );
      },
    );
  }
  _tapped(index){
    displayExOh = "O";
  }
}
