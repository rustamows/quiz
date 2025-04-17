import 'package:flutter/material.dart';
import 'package:quiz/model/history_model.dart';
import 'package:quiz/model/quiz_response_model.dart';
import 'package:quiz/repository/quiz_repository.dart';
import 'package:quiz/ui/home/quiz_screen.dart';
import 'package:quiz/ui/home/quiz_widget.dart';
import 'package:quiz/ui/result.dart';

class QuizPage extends StatefulWidget {
  final int count;
  final String? difficulty;
  final int? category;
  final categoryString;
  const QuizPage({
    Key? key,
    required this.count,
    required this.difficulty,
    required this.category,
    required this.categoryString,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  QuizResponseModel? quizResponseModel;
  QuizRepository _repository = QuizRepository();
  QuizScreen? quizScreen;
  PageController controller = PageController();
  int index = 1;
  int correctAnswer = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    print('----start');
    var quiz = await _repository.get(
      widget.count,
      widget.difficulty,
      widget.category,
    );
    print('--${quiz?.toJson()}');
    setState(() {
      quizResponseModel = quiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  widget.categoryString ?? 'All',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 240,
              child: LinearProgressIndicator(value: index / widget.count),
            ),
            Text('$index/${widget.count}'),
            SizedBox(height: 45),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value + 1;
                  });
                },
                itemCount: quizResponseModel?.results.length ?? 0,
                itemBuilder: (context, index) {
                  return QuizWidget(
                    quizResponseItemModel: quizResponseModel!.results[index],
                    next: (correct) {
                      if (correct) {
                        correctAnswer++;
                      }
                      next();
                    },
                  );
                },
              ),

            ),
            InkWell(onTap: () {
             next(); 
            }, child: Container(
              alignment: Alignment.center,
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffFF6581)
              ),child: Text('Skip'),
            ),),
            SizedBox(height: 77,)
          ],
        ),
      ),
    );
  }

  next() {
    if ((controller.page! + 1) == widget.count) {
      HistoryModel historyModel = HistoryModel(
        difficulty: widget.difficulty ?? 'All',
        category: widget.categoryString ?? 'Mixed',
        totalAnswer: widget.count,
        correctAnswer: correctAnswer,
        date: '${DateTime.now()}',
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(historyModel: historyModel),
        ),
      );
      return;
    }
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInExpo,
    );
  }
}
