import 'package:vinegar/models/models.dart';

class Article {
  String title;
  String description;
  String date;
  String author;
  String thumbnail;
  String sourceUrl;
  NewsSource originNewsSource;
  Article(
      {this.title,
      this.description,
      this.date,
      this.thumbnail,
      this.author,
      this.originNewsSource,
      this.sourceUrl});
}
