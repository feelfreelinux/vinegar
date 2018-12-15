import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';

class FeedApi extends ApiResource {
  FeedApi(ApiClient client) : super(client);

  Future<List<Article>> fetchFeed(String feedUrl) async {
    var feed =
        await this.client.getRSSFeed("https://www.theguardian.com/us/rss");
    var firstBatchArticles = feed.items.map((item) {
      return Article(
        author: item.dc.creator == null ? item.author : item.dc.creator,
        date: item.dc.date == null ? "2018-12-15T20:59:21Z" : item.dc.date,
        description: item.description,
        sourceUrl: item.link,
        thumbnail: item?.media?.contents == null ? null : item.media.contents[0].url,
        title: item.title,
      );
    }).toList();
    feed =
        await this.client.getRSSFeed("https://www.antyweb.pl/rss");
    var articlesAntyweb = feed.items.map((item) {
      return Article(
        author: item.dc.creator == null ? item.author : item.dc.creator,
        date: item.dc.date == null ? "2018-12-15T20:59:21Z" : item.dc.date,
        description: item.description,
        sourceUrl: item.link,
        thumbnail: null,
        title: item.title,
      );
    }).toList();
    firstBatchArticles.addAll(articlesAntyweb);
    firstBatchArticles.sort((a, b)  => a.title.compareTo(b.title));
    return firstBatchArticles;
  }
}
