export 'client.dart';
export 'promoted_news_sources.dart';
export 'resources/api_resource.dart';
export 'resources/feed.dart';
export 'resources/news_source.dart';
import 'package:vinegar/api/api.dart';

class Api {
  var _client = new ApiClient();

  FeedApi feed;
  NewsSourceApi newsSource;

  Api() {
    this.newsSource = NewsSourceApi(_client);
    this.feed = FeedApi(_client);
  }
}

final api = Api();
