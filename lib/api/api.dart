export 'client.dart';
export 'promoted_news_sources.dart';
export 'resources/api_resource.dart';
export 'resources/reddit/reddit_news_repository.dart';
export 'resources/rss/rss_news_repository.dart';
export 'resources/atom/atom_news_repository.dart';

export 'resources/news_source.dart';
export 'resources/news_repository.dart';
import 'package:vinegar/api/api.dart';

class Api {
  var _client = new ApiClient();

  RedditNewsRepository reddit;
  RSSNewsRepository rss;
  AtomNewsRepository atom;

  NewsSourceApi newsSource;

  Api() {
    this.newsSource = NewsSourceApi(_client);
    this.reddit = RedditNewsRepository(_client);
    this.rss = RSSNewsRepository(_client);
    this.atom = AtomNewsRepository(_client);

  }
}

final api = Api();
