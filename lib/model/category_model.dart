import 'dart:convert';

class CategoryModel {
  List<CategoryItem> triviaCategories;
  CategoryModel({
    required this.triviaCategories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trivia_categories': triviaCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      triviaCategories: List<CategoryItem>.from((map['trivia_categories']).map<CategoryItem>((x) => CategoryItem.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) {return CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);} 
}



class CategoryItem {
  int id;
  String name;
  CategoryItem({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CategoryItem.fromMap(Map<String, dynamic> map) {
    return CategoryItem(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryItem.fromJson(String source) => CategoryItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
