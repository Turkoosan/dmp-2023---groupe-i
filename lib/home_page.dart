import 'package:flutter/material.dart';
import 'package:projet_quiz/view/classementView.dart';
import 'package:projet_quiz/view/homeView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizUp'),
      ),
      body: PageView(onPageChanged: (index){
        setState(() {
          _currentIndex = index;
        });
      },
        controller: _pageController,
        children: const <Widget >[
            HomeView(),
            ClassementView(),
      ],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          _pageController.jumpToPage(_currentIndex);},
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: 'Accueil'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list,),
            label: 'Classement'
          ),
        ],
      ),
    );
  }
}
