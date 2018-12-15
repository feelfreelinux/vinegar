import 'package:rxdart/rxdart.dart';
import 'package:vinegar/models/models.dart';
import 'package:vinegar/api/api.dart';

class FeedBloc {
  final _newsSourceFetcher = BehaviorSubject<List<NewsSource>>();
  final _feedFetcher = BehaviorSubject<List<Article>>();
  Observable<List<Article>> get newestFeeds => _feedFetcher.stream;
  Observable<List<NewsSource>> get promotedNewsSources => _newsSourceFetcher.stream;

  fetchFeeds() async {
    var feeds = await api.feed.fetchFeed("");
    _feedFetcher.sink.add(feeds);
  }

  

  FeedBloc() {
    fetchFeeds();
  }

  dispose() {
    _feedFetcher.close();
    _newsSourceFetcher.close();
  }
}
