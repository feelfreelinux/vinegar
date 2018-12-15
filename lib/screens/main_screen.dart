import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/blocs/blocs.dart';
import 'package:vinegar/screens/screens.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    FeedScreen(),
    DiscoverScreen(),
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
        body: FeedBlocProvider(bloc: FeedBloc(), child: _children[_currentIndex]),
        floatingActionButton: DiamondFab(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(Icons.sort),
          elevation: 1,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: DiamondFab.notchedShape,
          notchMargin: 8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.rss_feed),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
        ));
  }
}
