import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/utils.dart';
import 'package:vinegar/models/models.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';

class FeedWidget extends StatelessWidget {
  final Article article;

  FeedWidget({this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            launchUrl(context, article.sourceUrl);
          },
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _drawHeader(),
                    _drawFooter(),
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget _drawHeader() {
    return Row(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          article.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )),
      article.thumbnail != null
          ? Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    image: AdvancedNetworkImage(article.thumbnail,
                        useDiskCache: true),
                  )),
            )
          : Container(),
    ]);
  }

  Widget _drawFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Image(
                  height: 14,
                  width: 14,
                  image: AdvancedNetworkImage(
                      "http://s2.googleusercontent.com/s2/favicons?domain_url=" +
                          article.sourceUrl,
                      useDiskCache: true))),
          Expanded(
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              text: TextSpan(children: [
                TextSpan(
                    text: Uri.parse(article.sourceUrl)
                        .host
                        .replaceAll("www.", ""),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: " • " + formatDate(article.date),
                    style: TextStyle(color: Colors.grey)),
                TextSpan(text: " • by ", style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: article.author,
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
