import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
int correct = 0;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: StartPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(index),
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
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer(index);

                setState(() {

                  if (correctAnswer == true) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    correct++;
                  } else {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }if(index==12){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EndScreen()));
                  }
                  if(index<12){
                    index++;}
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer(index);

                setState(
                  () {
                    if (correctAnswer == false) {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                      correct++;
                    } else {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    if(index==12){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EndScreen()));
                    }
                    if(index<12){
                      index++;}

                    });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    )));
  }
}
class EndScreen extends StatefulWidget {

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text('Your score is :\n$correct',
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
    padding: EdgeInsets.all(15.0),
    child: TextButton(
    style: TextButton.styleFrom(backgroundColor: Colors.green),
    child: Text(
    'Retry',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    onPressed: () {

    setState(() {

      correct = 0;
      Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
    });
    },
    ),
    ),
    ),
    Expanded(
    child: Padding(
    padding: EdgeInsets.all(15.0),
    child: TextButton(

    child: Text(
    'Return To Menu',
    style: TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    ),
    ),
    onPressed: () {

    setState(
    () {

      correct = 0;
      Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
    },
    );
    },
    ),
    ),
    ),
    ])));
    }
}

class StartPage extends StatefulWidget {

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Expanded(
        flex: 5,
        child: Padding(
        padding: EdgeInsets.all(10.0),
    child: Center(
    child: Text('QUIZZLER',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: 'Pacifico',
    fontSize: 50.0,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ),
    Expanded(
    child: Padding(
    padding: EdgeInsets.all(15.0),
    child: TextButton(
    style: TextButton.styleFrom(backgroundColor: Colors.green),
    child: Text(
    'Start Quiz',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    onPressed: () {

    setState(() {
      correct = 0;
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
    });
    },
    ),
    ),
    ),
        ])));
  }
}
