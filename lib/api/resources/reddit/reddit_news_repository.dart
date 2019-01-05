import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';

class RedditNewsRepository extends ApiResource implements NewsRepository {
  RedditNewsRepository(ApiClient client) : super(client);

  static NewsRepositoryCapabilities capabilities = NewsRepositoryCapabilities(
    pagination: true,
    articlePreview: false,
    comments: true,
  );

  Future<List<Article>> fetchFeed(NewsSource newsSource) async {
    print("downloading " + newsSource.feedUrl);
    var jsonResponse = await this
        .client
        .getJson("https://www.reddit.com" + newsSource.feedUrl + ".json");
    var map = jsonResponse["data"]["children"].toList().map((item) {
      return Article(
        author: item["data"]["author"],
        date: "2018-12-15T20:59:21Z",
        description:
            "${item["data"]["ups"]} votes ${item["data"]["num_comments"]} comments",
        sourceUrl: item["data"]["url"],
        thumbnail: getThumbnail(item),
        title: item["data"]["title"],
        originNewsSource: newsSource,
      );
    }).toList();
    print(map.map((e) => e.thumbnail));
    return List<Article>.from(map);
  }

  String getThumbnail(item) {
    try {
      var images = item["data"]["preview"]["images"][0]["resolutions"];
      return images[images.length - 1]["url"].replaceAll("&amp;", "&");
    } catch (e) {
      return null;
    }
  }
}
