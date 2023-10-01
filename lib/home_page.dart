import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/detail_page.dart';
import 'package:quiz/question_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final questions =
        Provider.of<QuestionProvider>(context, listen: true).getAllQuestions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Угадай'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          final question = questions[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(questionModel: question);
              }));
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      question.isAnswerTrue
                          ? question.trueImage
                          : "https://img.freepik.com/premium-vector/closed-treasures-chest-mysterious-ancient-vintage-casket-for-magic-user-equipment-vector-illustration_81894-5292.jpg",
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
