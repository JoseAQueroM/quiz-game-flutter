import 'question.dart';

class QuizBrain {

 int count = 0;

 final List<Question> questionsBank = [

        Question(questionText: 'El Monte Everest es la montaña más alta del mundo?',
                 questionAnswer: true),
        
        Question(questionText: 'La Mona Lisa fue pintada por Vincent van Gogh?', 
                 questionAnswer: true),
                                
        Question(questionText: 'La Torre Eiffel se encuentra en Berlín?', 
                 questionAnswer: false),
        
        Question(questionText: 'El símbolo químico del oro es Au?', 
                 questionAnswer: true),

        Question(questionText: 'La capital de Brasil es Río de Janeiro?', 
                 questionAnswer: false),

        Question(questionText: 'El Polo Norte está cubierto de hielo durante todo el año?', 
                 questionAnswer: true),
  ];

  void nextQuestion(){
    

    if (count < questionsBank.length - 1) {
      count++;
      print(count);
      print(questionsBank.length);
    
    } else {
      count = 0;
    }
  }

  String getQuestionText(){

      return questionsBank[count].questionText;
  }

  bool getAnswerBool(){
    return questionsBank[count].questionAnswer;
  }

}