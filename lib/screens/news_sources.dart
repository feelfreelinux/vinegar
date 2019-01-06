import 'package:flutter/material.dart';
import 'package:vinegar/models/models.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'dart:convert';

class NewsSourcesScreen extends StatefulWidget {
  @override
  NewsSourcesScreenState createState() {
    return new NewsSourcesScreenState();
  }
}

class NewsSourcesScreenState extends State<NewsSourcesScreen> {
  var textController = TextEditingController();
  bool isImageFeed = false;

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
            if (snapshot.hasData && snapshot.data.length > 0) {
              var newsSources = snapshot.data
                  .map((el) => NewsSource.fromJson(json.decode(el)))
                  .toList();
              return ListView.builder(
                itemCount: newsSources.length,
                itemBuilder: (context, index) {
                  return new NewsSourceItem(
                      newsSource: newsSources[index],
                      deleteCallback: () {
                        persistentSettings.newsSources =
                            persistentSettings.newsSources..removeAt(index);
                      });
                },
              );
            }
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Icon(
                    Icons.library_add,
                    size: 120,
                    color: Colors.grey,
                  ),
                  Text('Add some news sources to begin')
                ]));
          },
        ),
      ),
    );
  }
}

class NewsSourceItem extends StatelessWidget {
  const NewsSourceItem({
    Key key,
    @required this.deleteCallback,
    @required this.newsSource,
  }) : super(key: key);

  final VoidCallback deleteCallback;
  final NewsSource newsSource;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(newsSource.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(newsSource.feedUrl,
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
                newsSource.isImageFeed
                    ? Text('Image feed',
                        style:
                            TextStyle(fontSize: 16, color: Colors.orangeAccent))
                    : Container()
              ],
            ),
            Expanded(child: Container()),
            InkWell(
              child: Icon(Icons.delete_forever),
              onTap: deleteCallback,
            ),
          ],
        ),
      )),
    );
  }
}
