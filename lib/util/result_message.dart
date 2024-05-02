import 'package:flutter/material.dart';
import 'package:math_game22/const.dart';

class ResultMessage extends StatelessWidget {

  final String message;
  final VoidCallback onTap;
  // ignore: prefer_typing_uninitialized_variables
  final icon;

  const ResultMessage({
    Key? key,
    required this.message,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // the result
            Text(
              message,
              style: whiteTextStyle,
            ),

            // button to go next question
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Icon(icon, color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
