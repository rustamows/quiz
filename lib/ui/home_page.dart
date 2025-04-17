import 'package:flutter/material.dart';
import 'package:quiz/ui/history_screen.dart';
import 'package:quiz/ui/home/quiz_screen.dart';
import 'package:quiz/ui/settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int index = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [QuizScreen(), HistoryScreen(), SettingsScreen(),
        
            ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/compas.png', color: index == 0? Colors.purple: Colors.grey),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/world.png',color: index == 1? Colors.purple: Colors.grey),label: '' ),
          BottomNavigationBarItem(icon: Image.asset('assets/profile.png',color: index == 2? Colors.purple: Colors.grey),label: '')
        ],
      ),
      
    );
  }
}
