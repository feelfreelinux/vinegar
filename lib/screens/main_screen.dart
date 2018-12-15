import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    FeedWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          fixedColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.rss_feed,
              ),
              title: Text('Feed'),
            ),
          ]),
    );
  }
}
