import 'package:flutter/material.dart';
import 'package:vinegar/models/models.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class NewsSourceWidget extends StatelessWidget {
  final NewsSource newsSource;
  final boxShadow = [BoxShadow(color: Color(0x33000000), blurRadius: 1.0)];
  final double width = 80;
  final double borderWidth = 80 / 12;

  NewsSourceWidget({@required this.newsSource});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color(0x33000000), blurRadius: 1.0)
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).cardColor,
                        width: borderWidth)),
                child: Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AdvancedNetworkImage(newsSource.iconUrl,
                                useDiskCache: true))))),
          ]),
          Container(
            width: 125,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsSource.title,
                style: TextStyle(
                  fontSize: 16,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 30,
            child: new RaisedButton(
                child: new Text("Add to feed"),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          )
        ]),
      ),
    );
  }
}
