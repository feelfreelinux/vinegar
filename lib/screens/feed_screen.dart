import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/models/models.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: RefreshIndicator(
        onRefresh: () => FeedBlocProvider.of(context).fetchFeeds(),
        child: StreamBuilder<List<Article>>(
          stream: FeedBlocProvider.of(context).feedFetcher,
          initialData: FeedBlocProvider.of(context).feedFetcher.value,
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
      itemBuilder: (BuildContext context, int index) => FeedWidget(article: articles[index]));
  }
}
