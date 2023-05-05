import 'question.dart';

class Quizbrain
{
    int _questionumber = 0;
    List<Question> _QuestionBank = [
      Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
      Question(q:'Approximately one quarter of human bones are in the feet.', a: true),
      Question(q:  'A slug\'s blood is green.', a: true),
      Question(q:'Prince Harry is taller than Prince William', a: false),
      Question(q:  'There are five different blood groups', a: false),
      Question(q: 'There are 14 bones in a human foot', a: false),
      Question(q:'Fish cannot blink',  a: true),
      Question(q: 'Venus is the hottest planet in the solar system', a: true)
    ];

    void nextQuestion()
    {
      if(_questionumber <_QuestionBank.length-1)
      {
        _QuestionBank[_questionumber++];
      }
      else
      {
        _questionumber = 0;
      }
    }
    String getquestiontext()
    {
      return _QuestionBank[_questionumber].questiontext;
    }
    bool getquestionanswer()
    {
      return _QuestionBank[_questionumber].questionanswer;
    }
    int getlength()
    {
      return _QuestionBank.length;
    }
    bool isFinished()
    {
      if(_questionumber >= _QuestionBank.length - 1)
      {
        return true;
      }
      else
        return false;
    }
    void reset()
    {
      _questionumber = 0;
    }

}