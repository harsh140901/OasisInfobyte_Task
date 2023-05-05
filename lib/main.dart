import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizBrain = Quizbrain();

void main()
{
  runApp(
    Quizzeler(),
  );
}

class Quizzeler extends StatelessWidget {
  const Quizzeler({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,

        // AppBar of App
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Quizzeler',
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: 'SourceSansPro',
              color: Colors.white,
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade900,

        ),

        // Body of App
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool correctanswer = quizBrain.getquestionanswer();
  List<Icon> scorekeeper = [];
  void checkanswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(context: context, title: "!Finished", desc: "Quiz is completed",).show();
        quizBrain.reset();
        scorekeeper.clear();
      }
      else {
        if (userPickedAnswer == correctanswer) {
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        }
        else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                quizBrain.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: (){
                checkanswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),

            ) ,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: (){
                checkanswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ) ,
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                children: scorekeeper,
              ),
            ),
          ),
        ),
      ],
    );
  }
}