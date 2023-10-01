import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/question_model.dart';
import 'package:quiz/question_provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.questionModel});

  final QuestionModel questionModel;

  @override
  State<DetailPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailPage> {
  int answerToQuestion = 5;
  @override
  Widget build(BuildContext context) {
    final quesionProvider = context.read<QuestionProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("DetailPage"),
        centerTitle: true,
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.questionModel.title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                ),
                itemCount: widget.questionModel.questions.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = widget.questionModel.questions[index];
                  return GestureDetector(
                    onTap: () {
                      answerToQuestion = int.parse(data);
                      if (answerToQuestion == widget.questionModel.answer) {
                        setState(() {
                          quesionProvider
                              .toggleIsAnswerTrue(widget.questionModel.id);
                        });
                        Navigator.pop(context);
                      }
                      print('hehhehe$answerToQuestion');
                    },
                    child: Card(
                      child: Center(
                          child: Text(widget.questionModel.questions[index]
                              .toString())),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
