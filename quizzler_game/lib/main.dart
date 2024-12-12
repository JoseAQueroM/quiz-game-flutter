import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 59, 47, 47),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void resetQuiz() {
    setState(() {
      quizBrain.count = 0;
      scoreKeeper = [];
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //BOTON VERDADERO

        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FilledButton(
                style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green,
                    )),
                onPressed: () {
                  bool correctAnswer = quizBrain.getAnswerBool();

                  setState(() {
                    if (correctAnswer == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Respuesta Correcta',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );

                      scoreKeeper
                          .add(const Icon(Icons.check, color: Colors.green));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Respuesta Incorrecta',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      scoreKeeper
                          .add(const Icon(Icons.close, color: Colors.red));
                    }
                  });

                  if (quizBrain.count >= 5) {
                    setState(() {
                      quizBrain.count = 0;

                      Alert(
                        context: context,
                        title: "Juego finalizado",
                        buttons: [
                          DialogButton(
                            onPressed: () {
                              resetQuiz();
                            },
                            width: 120,
                            child: const Text(
                              "Reiniciar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ).show();
                    });
                  } else {
                    setState(() {
                      quizBrain.nextQuestion();
                    });
                  }
                },
                child: const Text(
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    'Verdadero'),
              )),
        ),

        // BOTON FALSO

        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FilledButton(
                style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.red,
                    )),
                onPressed: () {
                  bool correctAnswer = quizBrain.getAnswerBool();

                  setState(() {
                    if (correctAnswer == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Respuesta Correcta',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );

                      scoreKeeper
                          .add(const Icon(Icons.check, color: Colors.green));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Respuesta Incorrecta',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      scoreKeeper
                          .add(const Icon(Icons.close, color: Colors.red));
                    }
                  });

                  if (quizBrain.count >= 5) {
                    setState(() {
                      quizBrain.count = 0;

                      Alert(
                        context: context,
                        title: "Juego finalizado",
                        buttons: [
                          DialogButton(
                            onPressed: () {
                              resetQuiz();
                            },
                            width: 120,
                            child: const Text(
                              "Reiniciar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ).show();
                    });
                  } else {
                    setState(() {
                      quizBrain.nextQuestion();
                    });
                  }
                },
                child: const Text(
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    'Falso'),
              )),
        ),

        Row(
          children: scoreKeeper,
        ),
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
