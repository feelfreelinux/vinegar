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
    Text('TODO'),
    Text('TODO'),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: AppBar(
              title: Text('Feed', style: TextStyle(fontSize: 16.0)),
              elevation: 1.5,
              centerTitle: true,
              titleSpacing: 0.0)),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          fixedColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.rss_feed,
              ),
              title: Text('Feed'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Text('Discover'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              title: Text('Settings'),
            ),
          ]),
    );
  }
}
