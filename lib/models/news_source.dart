import 'package:vinegar/models/models.dart';

class NewsSource {
  String iconUrl;
  String websiteUrl;
  String title;
  String feedUrl;
  NewsHandler newsHandler;
  bool isObserved;

  NewsSource({this.iconUrl, this.websiteUrl, this.newsHandler, this.title, this.isObserved, this.feedUrl});
}