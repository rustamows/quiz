import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/category_model.dart';
import 'package:quiz/repository/category_repository.dart';
import 'package:quiz/ui/home/quiz_page.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {
  int? category;
  String? difficulty;
  CategoryModel? categoryModel;
  CategoryRepository repository = CategoryRepository();
  int count = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var s = await repository.get();
    setState(() {
      categoryModel = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 67, right: 68),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Quiz',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(height: 29),
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/tut.png'),
            ),
            SizedBox(height: 39),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Questions amount: $count'),
            ),
            Slider(
              min: 1,
              max: 20,
              value: count.toDouble(),
              onChanged: (v) {
                setState(() {
                  count = v.toInt();
                });
              },
            ),
            SizedBox(height: 11),
            Align(alignment: Alignment.bottomLeft, child: Text('Category')),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 7),
                    blurRadius: 64,
                    color: Color.fromRGBO(0, 0, 0, 0.07),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: category,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(value: null, child: Text('  All')),
                    for (CategoryItem category
                        in categoryModel?.triviaCategories ?? [])
                      DropdownMenuItem(
                        value: category.id,
                        child: Text(category.name),
                      ),
                  ],
                  onChanged: (v) {
                    setState(() {
                      category = v;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 11),
            Align(alignment: Alignment.bottomLeft, child: Text('Difficulty')),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 7),
                    blurRadius: 64,
                    color: Color.fromRGBO(0, 0, 0, 0.07),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: difficulty,
                  isExpanded: true,

                  items: [
                    DropdownMenuItem(value: null, child: Text('  All')),
                    DropdownMenuItem(value: '  Nasy', child: Text('  Easy')),
                    DropdownMenuItem(
                      value: '  Normal',
                      child: Text('  Normal'),
                    ),
                    DropdownMenuItem(value: '  Hard', child: Text('  Hard')),
                  ],
                  onChanged: (v) {
                    setState(() {
                      difficulty = v;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 64),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => QuizPage(
                          count: count,
                          difficulty: difficulty,
                          category: category,
                          categoryString:
                              category == null
                                  ? null
                                  : categoryModel!.triviaCategories
                                      .firstWhere((cat) => cat.id == category)
                                      .name,
                        ),
                  ),
                );
              },
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff6979F8),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
