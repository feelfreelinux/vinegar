import 'package:flutter/material.dart';
import 'package:vinegar/models/models.dart';
import 'dart:convert';

class NewsSourcesScreen extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.grey[100],
        child: StreamBuilder<List<String>>(
          stream: persistentSettings.newsSourcesStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData) {
              var newsSources = snapshot.data
                  .map((el) => NewsSource.fromJson(json.decode(el)))
                  .toList();
              return ListView.builder(
                itemCount: newsSources.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onLongPress: () {
                        persistentSettings.newsSources =
                            persistentSettings.newsSources..removeAt(index);
                      },
                      title: Text(newsSources[index].title));
                },
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(7.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "ADD NEW SOURCE",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _iconAddNewButton(Icons.add_box, "REDDIT",
                            () => _showAddRedditNewsSource(context)),
                        _iconAddNewButton(Icons.rss_feed, "RSS",
                            () => _showAddRssNewsSource(context)),
                        _iconAddNewButton(Icons.rss_feed, "ATOM",
                            () => _showAddAtomNewsSource(context)),
                      ],
                    ),
                    Container(
                      width: 34.0,
                      height: 34.0,
                      child: FloatingActionButton(
                        child: Icon(Icons.close),
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            Theme.of(context).textTheme.caption.color,
                        elevation: 0.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _iconAddNewButton(
      IconData icon, String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            elevation: 1.0,
            highlightElevation: 8.0,
            onPressed: onPressed,
            child: Icon(icon),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showAddRedditNewsSource(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add a new subreddit'),
              content: TextField(
                autofocus: true,
                controller: textController,
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL'),
                ),
                FlatButton(
                  onPressed: () {
                    persistentSettings.newsSources =
                        persistentSettings.newsSources ?? List<String>()
                          ..add(json.encode(NewsSource(
                            newsHandler: NewsHandler.REDDIT,
                            feedUrl: '/r/' + textController.text,
                            iconUrl: '',
                            websiteUrl: 'https://reddit.com',
                            title: 'Reddit /r/' + textController.text,
                            isObserved: true,
                          ).toJson()));
                    Navigator.pop(context);
                  },
                  child: Text('ADD'),
                ),
              ],
            ));
  }

  void _showAddAtomNewsSource(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add a new Atom'),
              content: TextField(
                autofocus: true,
                controller: textController,
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL'),
                ),
                FlatButton(
                  onPressed: () {
                    persistentSettings.newsSources =
                        persistentSettings.newsSources ?? List<String>()
                          ..add(json.encode(NewsSource(
                            newsHandler: NewsHandler.ATOM,
                            feedUrl: textController.text,
                            websiteUrl: textController.text,
                            title: textController.text,
                            isObserved: true,
                          ).toJson()));
                    Navigator.pop(context);
                  },
                  child: Text('ADD'),
                ),
              ],
            ));
  }

  void _showAddRssNewsSource(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add a new Rss'),
              content: TextField(
                autofocus: true,
                controller: textController,
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL'),
                ),
                FlatButton(
                  onPressed: () {
                    persistentSettings.newsSources =
                        persistentSettings.newsSources ?? List<String>()
                          ..add(json.encode(NewsSource(
                            newsHandler: NewsHandler.RSS,
                            feedUrl: textController.text,
                            websiteUrl: textController.text,
                            title: textController.text,
                            isObserved: true,
                          ).toJson()));
                    Navigator.pop(context);
                  },
                  child: Text('ADD'),
                ),
              ],
            ));
  }
}
