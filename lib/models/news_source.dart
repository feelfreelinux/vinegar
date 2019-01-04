import 'package:vinegar/models/models.dart';

class NewsSource {
  String iconUrl;
  String websiteUrl;
  String title;
  String feedUrl;
  NewsHandler newsHandler;
  bool isObserved;
  bool isImageFeed;

  Map<String, dynamic> toJson() {
    return {
      'iconUrl': this.iconUrl,
      'websiteUrl': this.websiteUrl,
      'feedUrl': this.feedUrl,
      'title': this.title,
      'newsHandler': this.newsHandler.toString(),
      'isObserved': this.isObserved,
      'isImageFeed': this.isImageFeed,
    };
  }

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    print(json["newsHandler"]);
    return NewsSource(
      iconUrl: json["iconUrl"] as String,
      websiteUrl: json["websiteUrl"] as String,
      title: json["title"] as String,
      feedUrl: json["feedUrl"] as String,
      newsHandler: NewsHandler.values.firstWhere(
          (e) => json["newsHandler"].toString().contains(e.toString())),
      isObserved: json["isObserved"] as bool,
      isImageFeed: json["isImageFeed"] as bool,
    );
  }

  NewsSource(
      {this.iconUrl,
      this.websiteUrl,
      this.newsHandler,
      this.title,
      this.isObserved,
      this.isImageFeed,
      this.feedUrl});
}
