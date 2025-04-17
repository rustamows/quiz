// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class HistoryListModel {
  List<HistoryModel> histories;
  HistoryListModel({required this.histories});
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'histories': histories.map((x) => x.toMap()).toList(),
    };
  }

  factory HistoryListModel.fromMap(Map<String, dynamic> map) {
    return HistoryListModel(
      histories: List<HistoryModel>.from((map['histories']).map<HistoryModel>((x) => HistoryModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryListModel.fromJson(String source) => HistoryListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


class HistoryModel {
   String difficulty;
   String category;
  // int incorrectAnswer;
  int totalAnswer;
int correctAnswer;

String date;
  HistoryModel({
    required this.difficulty,
    required this.category,
    // required this.incorrectAnswer,
    required this.totalAnswer,
    required this.correctAnswer,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'difficulty': difficulty,
      'category': category,
      'totalAnswer': totalAnswer,
      'correctAnswer': correctAnswer,
      'date': date,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      difficulty: map['difficulty'] as String,
      category: map['category'] as String,
      totalAnswer: map['totalAnswer'],
      correctAnswer: map['correctAnswer'] as int,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
