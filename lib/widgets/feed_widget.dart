import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/utils.dart';
import 'package:vinegar/models/models.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:html/parser.dart';

String _parseHtmlString(String htmlString) {
  var document = parse(htmlString);

  String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class FeedWidget extends StatelessWidget {
  final Article article;

  FeedWidget({this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GestureDetector(
          onTap: () async {
            launchUrl(context, article.sourceUrl);
          },
          child: Material(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _drawHeader(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 4.0, bottom: 8.0),
                      child: Text(_parseHtmlString(article.description),
                          maxLines: 1),
                    ),
                    // _drawFooter(),
                  ],
                ),
              ))),
    );
  }

  Widget _drawHeader() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
      Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
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
                  Text(
                    Uri.parse(article.sourceUrl).host.replaceAll("www.", "") +
                        " - " +
                        formatDate(article.date),
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Text(
              article.title,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
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
    ]));
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
