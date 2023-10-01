import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/question_model.dart';

class QuestionProvider with ChangeNotifier {
  static final List<QuestionModel> _questions = [
    QuestionModel(
      id: 0,
      title: 'Когда был выпушен первый ПК',
      questions: ['1930', '2000', '1990', '2022'],
      answer: 1930,
      isAnswerTrue: false,
      trueImage:
          "https://img.freepik.com/premium-vector/vector-3d-realistic-closed-and-opened-retro-vintage-antique-old-treasure-wooden-brown-pirate-dower-chest-with-golden-metal-stripes-padlock-and-keyhole-closeup-isolated-on-dark-background_153563-2813.jpg",
    ),
    QuestionModel(
      id: 1,
      title: 'Какие были основные характеристики первых ПК?',
      questions: ['1930', '2000', '1990', '2022'],
      answer: 1930,
      trueImage:
          "https://img.freepik.com/premium-vector/open-treasure-chest-wood_268834-62.jpg",
      isAnswerTrue: false,
    ),
    QuestionModel(
      id: 2,
      title: 'Какие были первые программы, доступные для первых ПК?',
      questions: ['1930', '2000', '1990', '2022'],
      answer: 1930,
      trueImage:
          "https://pngimg.com/uploads/treasure_chest/treasure_chest_PNG146.png",
      isAnswerTrue: true,
    ),
    QuestionModel(
      id: 3,
      title: 'Какие компании стали известными благодаря производству ПК?',
      questions: ['1930', '2000', '1990', '2022'],
      answer: 1930,
      trueImage:
          "https://i.pinimg.com/originals/a1/5f/2f/a15f2f638428d9da31c26004e36cc861.jpg",
      isAnswerTrue: false,
    ),
    QuestionModel(
      id: 4,
      title: 'Какой операционной системой обычно оснащались первые ПК?',
      questions: ['1930', '2000', '1990', '2022'],
      answer: 1930,
      trueImage:
          "https://avatars.mds.yandex.net/i?id=a4162c28f2945e8290c15c848ccae1ca2308df16-8710170-images-thumbs&n=13",
      isAnswerTrue: false,
    ),
    QuestionModel(
      id: 5,
      title: 'Какой операционной системой обычно оснащались первые ПК?',
      questions: ['1930', '2000', '1990', '2022'],
      answer: 1930,
      trueImage: "https://pngimg.com/d/treasure_chest_PNG41.png",
      isAnswerTrue: false,
    ),
  ];

  void createQuestion(QuestionModel question) {
    _questions.add(question);
    notifyListeners();
  }

  List<QuestionModel> getAllQuestions() {
    return _questions;
  }

  QuestionModel getQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      return _questions[index];
    }
    throw Exception('Question not found');
  }

  void updateQuestion(int index, QuestionModel updatedQuestion) {
    if (index >= 0 && index < _questions.length) {
      _questions[index] = updatedQuestion;
      notifyListeners();
    } else {
      throw Exception('Question not found');
    }
  }

  void deleteQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _questions.removeAt(index);
      notifyListeners();
    } else {
      throw Exception('Question not found');
    }
  }

  void toggleIsAnswerTrue(int? index) {
    _questions[index!].isAnswerTrue = true;
    notifyListeners();
  }

  // Сериализовать список вопросов в JSON
  String toJson() {
    final List<Map<String, dynamic>> questionList =
        _questions.map((question) => question.toMap()).toList();
    return json.encode(questionList);
  }

  // Десериализовать список вопросов из JSON
  void fromJson(String jsonString) {
    final List<dynamic> parsedJson = json.decode(jsonString);
    _questions.clear();
    _questions.addAll(
      parsedJson.map((json) => QuestionModel.fromMap(json)).toList(),
    );
    notifyListeners();
  }
}
