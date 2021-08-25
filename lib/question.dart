class Question{

  String questionText;
  bool questionAnswer;

  Question(String q, bool r){
    questionAnswer = r;
    questionText = q;
  }
}

Question newQuestion =Question('text', true);