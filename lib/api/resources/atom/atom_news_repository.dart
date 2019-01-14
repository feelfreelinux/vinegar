import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';
import 'package:webfeed/webfeed.dart';

class AtomNewsRepository extends ApiResource implements NewsRepository {
  AtomNewsRepository(ApiClient client) : super(client);

  static NewsRepositoryCapabilities capabilities = NewsRepositoryCapabilities(
    pagination: true,
    articlePreview: true,
    comments: false,
  );

  Future<AtomFeed> _getAtomFeed(String feedUrl) async {
    var xmlString = await this.client.getXml(feedUrl);
    return AtomFeed.parse(xmlString);
  }

  Future<List<Article>> fetchFeed(NewsSource newsSource) async {
    var feed = await _getAtomFeed(newsSource.feedUrl);
    return feed.items.map((item) {
      return Article(
        author: item.authors.first.name ?? "No author",
        date: item.published ?? "2018-12-15T20:59:21Z",
        description: item.summary,
        sourceUrl: item.links.first.href.toString(),
        thumbnail: getThumbnail(item),
        title: item.title,
        originNewsSource: newsSource,
      );
    }).toList();
  }

  String getThumbnail(AtomItem item) {
    try {
      return item.media.contents?.first?.url;
    } catch (e) {
      return null;
    }
  }
}
