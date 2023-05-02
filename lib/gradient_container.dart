import 'dart:math';

import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {

  var _diceNumber = 1;
  final _random = Random();

  rollDice() {
    //generate a random number between 1 and 6
    final randomNumber = _random.nextInt(6) + 1;
    setState(() {
      _diceNumber = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: widget.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/dice-$_diceNumber.png",
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            //a button to roll the dice
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white24,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                elevation: 10,
              ),
              child: const Text(
                "Roll the dice",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
