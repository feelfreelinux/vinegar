import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/models/models.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class FeedWidget extends StatelessWidget {
  final Article article;
  FeedWidget({this.article});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
            child: ListTile(
                title: Text(article.title),
                trailing: Image(
                    image: AdvancedNetworkImage(article.thumbnail,
                        useDiskCache: true))))
      ],
    );
  }
}
