import 'package:flutter/material.dart';

import 'package:quiz/model/quiz_response_model.dart';

class QuizWidget extends StatefulWidget {
  final QuizResponseItemModel quizResponseItemModel;
  final Function(bool correct) next;
  const QuizWidget({
    Key? key,
    required this.quizResponseItemModel,
    required this.next,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QuizWidget();
}

class _QuizWidget extends State<QuizWidget> {
  Map<int, Color> clicked = {};
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(widget.quizResponseItemModel.questions),
          // for (String answer in widget.quizResponseItemModel.mixedAnswer)
         SizedBox(height: 42,),
         button(0),
         button(1),
         if (widget.quizResponseItemModel.type == 'Multiple')button(2),
         if (widget.quizResponseItemModel.type == 'Multiple')button(3),
        ],
      ),
    );
  }

  Widget button(i) {
    return InkWell(
      onTap: () async {
        bool correct =
            widget.quizResponseItemModel.mixedAnswer[i] ==
            widget.quizResponseItemModel.correctAnswer;
        setState(() {
          clicked[i] = correct ? Colors.green : Colors.red;
        });
        await Future.delayed(Duration(seconds: 1));
        widget.next(correct);
      },
      child: Container(
        alignment: Alignment.center,
        width: 280,
        height: 40,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: clicked[i] ?? Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
        ),child: Text(widget.quizResponseItemModel.mixedAnswer[i],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
