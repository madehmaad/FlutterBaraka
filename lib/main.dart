import 'dart:async';
// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:quiz_app_pro/Interface/Questions.dart';
import 'package:quiz_app_pro/methods.dart';

void main() {
  runApp(MyApp());
}

int correct = 0;
int notCorrect = 0;
int ind2 = 0;
int score = 0;
num answerTime = question[ind2].time;
double greenwidth = 10;
double redwidth = 10;
Color color = Colors.white;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

PageController controller = PageController();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with methods {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime--;
        if (answerTime == 5) {
          showMyFlushBar(context);
        } else if (answerTime == 0) {
          // answerTime++;
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
          notCorrect++;
          score--;

          controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
          answerTime = question[ind2].time;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      onPageChanged: (value) => ind2 = value,
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: question.length,
      itemBuilder: (context, index) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Score is:     ' + score.toString(),
            style: TextStyle(
              color: Color.fromARGB(255, 243, 222, 222),
              fontSize: 20,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          backgroundColor: Color(0xFFA32EC1),
          elevation: 0,
          leading: Icon(Icons.west),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xFFA32EC1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230, left: 330),
              child: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Container(
                width: 90,
                height: 90,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 100),
              child: Container(
                width: 90,
                height: 90,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 0),
              child: Container(
                width: 90,
                height: 90,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50),
              child: Container(
                width: 281,
                height: 170,
                child: Padding(
                    padding: EdgeInsets.only(top: 100, left: 0),
                    child: Center(
                      child: Text(
                        question[index].question,
                        style: TextStyle(
                          color: Color(0xFF2B252C),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    )),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFFBEBFF),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 140),
              child: Text(
                'Question ' +
                    (index + 1).toString() +
                    '/' +
                    question.length.toString(),
                style: TextStyle(
                  color: Color(0xFFA32EC1),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350, left: 50),
              child: SizedBox(
                width: 300,
                height: 500,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 10,
                    color: Colors.white,
                  ),
                  itemCount: question[index].answers.length,
                  itemBuilder: (context, ind) => InkWell(
                    onTap: () {
                      checkoutAnswer(question[index].answers[ind].isCorrect,
                          context, question[index].time, answerTime);
                      answerTime = question[index].time;
                      color = Colors.white;

                      // checkoutAnswer(question[index].answers[ind].isCorrect,
                      //     context, question[index].time, answerTime);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 240,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color(0xFFA32EC1),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: ListTile(
                          trailing: Container(
                            width: 20,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: color,
                              shape: OvalBorder(
                                  side: BorderSide(color: Colors.black)),
                            ),
                          ),
                          title: Text(
                            question[index].answers[ind].answer,
                            style: TextStyle(
                              color: Color(0xFF2B252C),
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 160),
              child: Container(
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      value: answerTime / question[index].time,
                      color: Color(0xFFA32EC1),
                    ),
                    height: 55,
                    width: 55,
                  ),
                ),
                width: 67,
                height: 67,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 160),
              child: SizedBox(
                height: 67,
                width: 67,
                child: Center(
                  child: Text(
                    answerTime.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA32EC1),
                      fontSize: 20,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 100, left: 50),
                child: Container(
                  width: 290,
                  child: ListTile(
                    leading: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            correct.toString() + '   ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 14, 201, 20),
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Container(
                            width: greenwidth,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF1E8334),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: redwidth,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Text(
                            '   ' + notCorrect.toString(),
                            style: TextStyle(
                              color: Color.fromARGB(255, 232, 10, 10),
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}

class scorepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(score.toString()),
      ),
    );
  }
}
class madeh extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
