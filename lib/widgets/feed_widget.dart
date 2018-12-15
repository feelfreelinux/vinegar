import 'package:flutter/material.dart';
import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';

class FeedWidget extends StatelessWidget {
  var api = Api();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: api.feed.fetchFeed(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('loading...');
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else {
              return createListView(context, snapshot);
            }
        }
      },
    ));
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Article> articles = snapshot.data;
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        Article article = articles[index];
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(article.title),
            ),
            Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
