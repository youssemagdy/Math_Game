import 'package:flutter/material.dart';
import 'package:math_game22/const.dart';

// ignore: must_be_immutable
class NumberKey extends StatelessWidget {
  final String child;
  var buttonColor = Colors.deepPurple[400];
  final VoidCallback onTap;

  NumberKey({
    Key? key,
    required this.child,
    required this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    if (child == 'C'){
      buttonColor = Colors.green;
    }
    else if (child == 'DEL'){
      buttonColor = Colors.red;
    }
    else if (child == '='){
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
