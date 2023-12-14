import 'package:flutter/material.dart';
import 'dart:math';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int diceNumber=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent.shade400,
      appBar: AppBar(
        title: Text("Roll Dice"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:Image.asset("image/dice-$diceNumber.png",width: 200,),

          ),
          TextButton(onPressed: (){
            setState(() {
              diceNumber=Random().nextInt(6)+1;
            });

          }, child: Text("Change Image"))
        ],
      ),

    );
  }
}
