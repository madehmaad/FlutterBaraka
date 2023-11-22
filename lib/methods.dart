import 'package:flutter/material.dart';
import 'package:quiz_app_pro/Interface/Questions.dart';
import 'package:quiz_app_pro/main.dart';
import 'package:another_flushbar/flushbar.dart';

mixin methods {
  checkoutAnswer(
      bool isCorrect, BuildContext context, num time, num answerTime) {
    if (time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        content: Center(
            child: Text(
          'Time Out',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        )),
        backgroundColor: Colors.blue,
      ));
      redwidth = redwidth + 20;
      color = Colors.red;
      score--;
      notCorrect++;
      controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    } else {
      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          content: Center(
              child: Text(
            'Success',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
          backgroundColor: Colors.green,
        ));
        controller.nextPage(
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        score++;
        correct++;
        greenwidth = greenwidth + 20;

        print(controller);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          content: Center(
              child: Text(
            'Failed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
          backgroundColor: Colors.red,
        ));

        controller.nextPage(
            duration: Duration(seconds: 1), curve: Curves.linear);
        score--;
        notCorrect++;
        redwidth = redwidth + 20;
        color = Colors.red;
      }
    }
  }

  checktime(int index, num time, num answertime, BuildContext context) {
    if (question[index].time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Time Out'),
        backgroundColor: Colors.blue,
      ));
    }
  }
}
showMyFlushBar(BuildContext context) {
  Flushbar(
    title: "Time Out warning!",
    titleColor: Colors.white,
    message: "remaining 5 seconds",
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.red,
    boxShadows: [
      BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)
    ],
    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: false,
    duration: Duration(seconds: 4),
    icon: Icon(
      Icons.check,
      color: Colors.greenAccent,
    ),
    mainButton: ElevatedButton(
      onPressed: () {},
      child: Text(
        "CLAP",
        style: TextStyle(color: Colors.amber),
      ),
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      "Dear Student",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.yellow[600],
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      "pleas focus! remaining 5 seconds",
      style: TextStyle(
          fontSize: 18.0,
          color: Colors.green,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  )..show(context);
}
