import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: _DicePage(),
      ),
    ));

class _DicePage extends StatefulWidget {
  @override
  __DicePageState createState() => __DicePageState();
}

class __DicePageState extends State<_DicePage> {
  int leftDiceNo = 5;
  int rightDiceNo = 5;

  String draw = "None";

  void changeDiceState() {
    setState(() {
      leftDiceNo = Random().nextInt(6) + 1;
      rightDiceNo = Random().nextInt(6) + 1;
      if (leftDiceNo == rightDiceNo) {
        draw = "Same Dice";
      } else {
        draw = "Different Dice";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'It\'s a $draw',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    // print("Left Button Pressed");
                    //  print('dice: $leftDiceNo');
                    changeDiceState();
                  },
                  child: Image.asset('images/dice$leftDiceNo.png'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    // print("Right  Button Pressed");
                    changeDiceState();
                  },
                  child: Image.asset('images/dice$rightDiceNo.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
