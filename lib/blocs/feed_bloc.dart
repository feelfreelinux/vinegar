import 'package:rxdart/rxdart.dart';
import 'package:vinegar/models/models.dart';
import 'package:vinegar/api/api.dart';
import 'dart:convert';

class FeedBloc {
  final newsSourceFetcher = BehaviorSubject<List<NewsSource>>();
  final feedFetcher = BehaviorSubject<List<Article>>(seedValue: []);
  Observable<List<NewsSource>> get promotedNewsSources =>
      newsSourceFetcher.stream;
  Observable<List<Article>> get newestFeeds => feedFetcher.stream;

  fetchFeeds() async {
    var value = persistentSettings.newsSources;
    value.forEach((value) async {
      var newsSource = NewsSource.fromJson(json.decode(value));
      switch (newsSource.newsHandler) {
        case NewsHandler.REDDIT:
          _addFeeds(await api.reddit.fetchFeed(newsSource));
          break;
        case NewsHandler.RSS:
          _addFeeds(await api.rss.fetchFeed(newsSource));
          break;
        case NewsHandler.ATOM:
          _addFeeds(await api.atom.fetchFeed(newsSource));
          break;
      }
    });
  }

  void _addFeeds(List<Article> articles) {
    feedFetcher.add(feedFetcher.value..addAll(articles));
  }

  FeedBloc() {
    fetchFeeds();
  }

  dispose() {
    feedFetcher.close();
    newsSourceFetcher.close();
  }
}
