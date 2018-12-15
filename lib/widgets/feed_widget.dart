import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/models/models.dart';

class FeedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () => FeedBlocProvider.of(context).fetchFeeds(),
        child: StreamBuilder<List<Article>>(
          stream: FeedBlocProvider.of(context).newestFeeds,
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: snapshot.hasData && snapshot.data.length > 0
                  ? _createListView(context, snapshot.data)
                  : Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, List<Article> articles) {
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
