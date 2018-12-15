export 'client.dart';
export 'resources/api_resource.dart';
export 'resources/feed.dart';
import 'package:vinegar/api/api.dart';

class Api {
  var _client = new ApiClient();

  FeedApi feed;

  Api() {
    this.feed = FeedApi(_client);
  }
}

final api = Api();
