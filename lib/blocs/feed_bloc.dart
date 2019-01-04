import 'package:rxdart/rxdart.dart';
import 'package:vinegar/models/models.dart';
import 'package:vinegar/api/api.dart';

class FeedBloc {
  final newsSourceFetcher = BehaviorSubject<List<NewsSource>>();
  final feedFetcher = BehaviorSubject<List<Article>>();
  Observable<List<NewsSource>> get promotedNewsSources => newsSourceFetcher.stream;
  Observable<List<Article>> get newestFeeds => feedFetcher.stream;

  fetchFeeds() async {
    var feeds = await api.reddit.fetchFeed(NewsSource(feedUrl: "/r/news"));
    feedFetcher.add(feeds);
  }

  FeedBloc() {
    fetchFeeds();
  }

  dispose() {
    feedFetcher.close();
    newsSourceFetcher.close();
  }
}
