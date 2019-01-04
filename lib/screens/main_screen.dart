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
    NewsSourcesScreen(),
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
              titleSpacing: 0.0,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.list),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                    leading: Icon(Icons.favorite),
                                    title: Text('Favorites'),
                                    onTap: () {}),
                                ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Edit sources'),
                                    onTap: () {}),
                                Divider(),
                                ListTile(
                                    leading: Icon(Icons.settings),
                                    title: Text('Settings'),
                                    onTap: () {}),
                              ],
                            );
                          });
                    }),
              ],
            )),
        body:
            FeedBlocProvider(bloc: FeedBloc(), child: _children[_currentIndex]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.sort, color: Theme.of(context).accentColor),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
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
