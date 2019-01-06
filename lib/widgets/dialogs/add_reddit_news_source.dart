import 'package:flutter/material.dart';
import 'package:vinegar/models/models.dart';
import 'dart:convert';

class AddRedditNewsSourceDialog extends StatefulWidget {
  _AddRedditNewsSourceDialogState createState() => _AddRedditNewsSourceDialogState();
}

class _AddRedditNewsSourceDialogState extends State<AddRedditNewsSourceDialog> {
  final textController = TextEditingController();
  bool isImageFeed = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new subreddit'),
      content: TextField(
        autofocus: true,
        controller: textController,
      ),
      actions: <Widget>[
        Column(children: <Widget>[
          Row(
            children: <Widget>[
              Text('Has full sized images?'),
              Switch(
                onChanged: (bool value) => setState(() {
                      isImageFeed = value;
                    }),
                value: false,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('CANCEL'),
              ),
              FlatButton(
                onPressed: () {
                  persistentSettings.newsSources =
                      persistentSettings.newsSources ?? List<String>()
                        ..add(json.encode(NewsSource(
                          newsHandler: NewsHandler.REDDIT,
                          feedUrl: '/r/' + textController.text,
                          iconUrl: '',
                          websiteUrl: 'https://reddit.com',
                          title: 'Reddit /r/' + textController.text,
                          isObserved: true,
                          isImageFeed: isImageFeed,
                        ).toJson()));
                  Navigator.pop(context);
                },
                child: Text('ADD'),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
