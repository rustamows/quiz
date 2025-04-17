// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuizResponseModel {
  List<QuizResponseItemModel> results;
  QuizResponseModel({required this.results});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'results': results.map((x) => x.toMap()).toList()};
  }

  factory QuizResponseModel.fromMap(Map<String, dynamic> map) {
    return QuizResponseModel(
      results: List<QuizResponseItemModel>.from(
        (map['results']).map<QuizResponseItemModel>(
          (x) => QuizResponseItemModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizResponseModel.fromJson(String source) =>
      QuizResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class QuizResponseItemModel {
  String type;
  String difficulty;
  String category;
  String questions;
  String correctAnswer;
  List<String> incorrectAnswer;
   List<String> mixedAnswer;
  QuizResponseItemModel({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.questions,
    required this.correctAnswer,
    required this.incorrectAnswer,
    required this.mixedAnswer
  }){
    mixedAnswer.add(correctAnswer);
    mixedAnswer.addAll(incorrectAnswer);
    mixedAnswer.shuffle();
  }
 
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'difficulty': difficulty,
      'category': category,
      'questions': questions,
      'correctAnsver': correctAnswer,
      'incorrectAnswer': incorrectAnswer,
    };
  }

  factory QuizResponseItemModel.fromMap(Map<String, dynamic> map) {
    return QuizResponseItemModel(
      type: map['type'] ,
      difficulty: map['difficulty'] ,
      category: map['category'] ,
      questions: map['question'],
      correctAnswer: map['correct_answer'],
      incorrectAnswer: List<String>.from((map['incorrect_answers']),
    ), mixedAnswer: []);
  }

  String toJson() => json.encode(toMap());

  factory QuizResponseItemModel.fromJson(String source) => QuizResponseItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
