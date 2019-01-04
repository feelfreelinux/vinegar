import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';
import 'package:webfeed/webfeed.dart';

class RSSNewsRepository extends ApiResource implements NewsRepository {
  RSSNewsRepository(ApiClient client) : super(client);

  static NewsRepositoryCapabilities capabilities = NewsRepositoryCapabilities(
    pagination: true,
    articlePreview: true,
    comments: false,
  );

  Future<RssFeed> _getRSSFeed(String feedUrl) async {
    var xmlString = await this.client.getXml(feedUrl);
    return RssFeed.parse(xmlString);
  }

  Future<List<Article>> fetchFeed(NewsSource newsSource) async {
    var feed =
        await this._getRSSFeed(newsSource.feedUrl);
    return feed.items.map((item) {
      return Article(
        author: item.dc.creator ?? item.author,
        date: item.dc.date ?? "2018-12-15T20:59:21Z",
        description: item.description,
        sourceUrl: item.link,
        thumbnail: item.media.contents?.first?.url,
        title: item.title,
      );
    }).toList();
  }
}
