import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game22/const.dart';
import 'package:math_game22/util/number_key.dart';
import 'package:math_game22/util/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number pad list
  List<String> numberPad =[
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];

  // number A, number B
  int numberA = 1;
  int numberB = 1;

  // user answer
  String userAnswer = '';

  // User Tapped a Button
  void buttonTapped (String button){
    setState(() {
      if (button == '='){
        // calculate if user correct or incorrect
        checkResult();
      }
      else if (button == 'C'){
        // clear the input
        userAnswer = '';
      }
      else if (button == 'DEL'){
        // delete the last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0 , userAnswer.length - 1);
        }
      }
      else if (userAnswer.length < 3) {
        // maximum of 3 number can be inputted
        userAnswer += button;
      }
    });
  }

  // check if User is correct or not
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)){
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Correct!',
            onTap: goToNextQuestion,
            icon: const Icon(Icons.arrow_forward, color: Colors.white,),
          );
        }
      );
    }
    else {
      ResultMessage(
          message: 'Sorry Try Again',
          onTap: goBackToQuestion,
          icon: const Icon(Icons.rotate_90_degrees_ccw, color: Colors.white,),
      );
    }
  }

  // create random number
  var randomNumber = Random();

  // Go To Next Question
  void goToNextQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();

    // reset value
    setState(() {
      userAnswer = '';
    });

    // create a new question
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  // Go TO Back Question
  void goBackToQuestion(){
    // dismiss alert dialog
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          // level progress play need 5 correct answer
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),

          // question
          Expanded(
              child: Container(
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // question
                        Text(
                          numberA.toString() + ' + ' + numberB.toString() + ' = ',
                          style: whiteTextStyle,
                        ),

                        // user answer box
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[400],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              userAnswer,
                              style: whiteTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              )
          ),

          //number pad
          Expanded(
            flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  itemCount: numberPad.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index)  {
                    return NumberKey(
                      child: numberPad[index],
                      onTap: () => buttonTapped(numberPad[index]),
                    );
                  }
                ),
              ),
          ),

        ],
      ),
    );
  }
}
