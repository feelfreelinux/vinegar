import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/models/models.dart';
import 'package:pref_gen_flutter/pref_gen_flutter.dart';
import 'dart:convert';

class NewsSourcesScreen extends StatelessWidget {
  var redditTextController = TextEditingController();

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
                  return ListTile(onLongPress: () {
                    persistentSettings.newsSources = persistentSettings.newsSources..removeAt(index);
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
          _showAddRedditNewsSource(context);
        },
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
                controller: redditTextController,
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text('CANCEL'),
                ),
                new FlatButton(
                  onPressed: () {
                    persistentSettings.newsSources =
                        persistentSettings.newsSources ?? List<String>()
                          ..add(json.encode(NewsSource(
                            newsHandler: NewsHandler.REDDIT,
                            feedUrl: '/r/' + redditTextController.text,
                            iconUrl: '',
                            websiteUrl: 'https://reddit.com',
                            title: 'Reddit /r/' + redditTextController.text,
                            isObserved: true,
                          ).toJson()));
                    Navigator.pop(context);
                  },
                  child: new Text('ADD'),
                ),
              ],
            ));
  }
}
