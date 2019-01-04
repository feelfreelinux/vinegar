import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';

class NewsRepositoryCapabilities {
  bool pagination;
  bool comments;
  bool articlePreview;
  NewsRepositoryCapabilities({this.pagination, this.comments, this.articlePreview});
}

abstract class NewsRepository {
  static NewsRepositoryCapabilities capabilities;
  Future<List<Article>> fetchFeed(NewsSource newsSource, );
}