import 'package:flutter/material.dart';
import 'package:quiz/model/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatelessWidget {
  final HistoryModel historyModel;

  const ResultPage({super.key,required this.historyModel});
  @override
  Widget build(BuildContext context) {
    save();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Results',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Image.asset('assets/ic_done.png'),
              SizedBox(height: 52),
              Container(
                width: 342,
                height: 174,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Category: ${historyModel.category}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Difficulty: '),
                          Text('Correct answers '),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${historyModel.difficulty}'),
                          Text(
                            '${historyModel.correctAnswer}/${historyModel.totalAnswer}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 82),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff4CE2A7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Finish'),
                ),
              ),
              SizedBox(height: 124),
            ],
          ),
        ),
      ),
    );
  }
  save()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.remove('histories');
    var v = sharedPreferences.getString(
      'histories'
    );
    if ( v!= null){
      HistoryListModel historyListModel = HistoryListModel.fromJson(v);
      historyListModel.histories.add(historyModel);
      sharedPreferences.setString('histories', historyListModel.toJson());
    } else{
    HistoryListModel historyListModel = HistoryListModel(histories: [historyModel]);
    sharedPreferences.setString('histories', historyListModel.toJson());
    }
  }
}
