import 'package:flutter/material.dart';
import 'package:quiz/model/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryScreen();
  }
}

class _HistoryScreen extends State<HistoryScreen> {
  HistoryListModel? historyListModel;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '  History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: RefreshIndicator( onRefresh: getData,
              child: ListView.builder(
                itemCount: historyListModel?.histories.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          // height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xff1F20411A),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Category: ${historyListModel?.histories[index].category}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(Icons.more_horiz_outlined, color: Colors.grey),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Difficulty: '),
                                    Text(
                                      '${historyListModel?.histories[index].difficulty}',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Correct answers: '),
              
                                    Text('${historyListModel?.histories[index].correctAnswer}'),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '${historyListModel?.histories[index].date}',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future <void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.clear();
    var value = sharedPreferences.getString('histories');
    if (value != null) { 
      // HistoryListModel historyListModel = HistoryListModel.fromJson(value);
      print('------$value');
      HistoryListModel  histories = HistoryListModel.fromJson(value);
      setState(() {
        historyListModel = histories;
      });
    } else {
      setState(() {
        historyListModel = null;
      });
    }
  }
}
