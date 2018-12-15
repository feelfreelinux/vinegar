import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';

class FeedApi extends ApiResource {
  FeedApi(ApiClient client) : super(client);

  Future<List<Article>> fetchFeed({String feedUrl}) async {
    var feed =
        await this.client.getRSSFeed("https://www.theguardian.com/us/rss");
    return feed.items.map((item) {
      return Article(
        author: item.author,
        date: item.pubDate,
        description: item.description,
        sourceUrl: item.source.url,
        thumbnail: item.media.contents[0].url,
        title: item.title,
      );
    });
  }
}
