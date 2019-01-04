import 'package:vinegar/api/api.dart';
import 'package:vinegar/models/models.dart';
import 'dart:async';

class NewsSourceApi extends ApiResource {
  NewsSourceApi(ApiClient client) : super(client);

  Future<List<NewsSource>> searchNewsSources(String query) async {
    return [];
  }

  // We need to find an api to get these @TODO
  Future<List<NewsSource>> getPromotedNewsSources() async {
    return [
      hackerNews,
      bbc,
      guardianUS,
    ];
  }
}
