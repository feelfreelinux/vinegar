import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/utils.dart';
import 'package:vinegar/models/models.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:html/parser.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';

String _parseHtmlString(String htmlString) {
  try {
      var document = parse(htmlString);
    return parse(document.body.text).documentElement.text;
  } catch (e) {
    return htmlString;
  }
}

class FeedWidget extends StatelessWidget {
  final Article article;

  FeedWidget({this.article}) : super(key: Key(article.title));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GestureDetector(
          onTap: () async {
            launchUrl(context, article.sourceUrl);
          },
          child: Material(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _drawHeader(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_parseHtmlString(article.description ?? ""),
                          maxLines: 1),
                    ),
                    article.thumbnail != null &&
                            article.thumbnail.isNotEmpty &&
                            !article.originNewsSource.isImageFeed
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 8, left: 8, right: 8),
                            child: _renderNewsHandler(context),
                          )
                        : Container(),
                    article.thumbnail != null &&
                            article.thumbnail.isNotEmpty &&
                            article.originNewsSource.isImageFeed
                        ? Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: PinchZoomImage(
                                image: Image(
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    image: AdvancedNetworkImage(
                                        article.thumbnail,
                                        useDiskCache: true)),
                                zoomedBackgroundColor:
                                    Color.fromRGBO(240, 240, 240, 1.0),
                                hideStatusBarWhileZooming: false,
                              ),
                            ))
                        : Container(),
                  ],
                ),
              ))),
    );
  }

  Widget _renderNewsHandler(BuildContext context) {
    return Row(children: <Widget>[
      Text(article.originNewsSource.title.split(' ')[0] + ' ',
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold)),
      Text(article.originNewsSource.title.split(' ')[1],
          style: TextStyle(color: Colors.blueAccent)),
    ]);
  }

  Widget _drawHeader() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                            Uri.parse(article.sourceUrl)
                                    .host
                                    .replaceAll("www.", "") +
                                " - " +
                                formatDate(article.date),
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey),
                          ),
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
            ),
            article.thumbnail != null &&
                    article.thumbnail.isNotEmpty &&
                    !article.originNewsSource.isImageFeed
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
          ]),
        ));
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
