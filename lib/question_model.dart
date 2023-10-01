class QuestionModel {
  int? id;
  String title;
  List<String> questions;
  int answer;
  bool isAnswerTrue;
  String trueImage;

  QuestionModel({
    required this.id,
    required this.title,
    required this.questions,
    required this.answer,
    required this.isAnswerTrue,
    required this.trueImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'questions': questions,
      'answer': answer,
      'isAnswerTrue': isAnswerTrue,
      "trueImage": trueImage,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
        id: map['id'],
        title: map['title'],
        questions: map['questions'],
        answer: map['answer'],
        isAnswerTrue: map['isAnswerTrue'],
        trueImage: map["trueImage"]);
  }
}
