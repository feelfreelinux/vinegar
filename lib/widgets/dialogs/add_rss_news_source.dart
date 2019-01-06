import 'package:flutter/material.dart';
import 'package:vinegar/models/models.dart';
import 'dart:convert';

class AddRSSNewsSourceDialog extends StatefulWidget {
  _AddRSSNewsSourceDialogState createState() => _AddRSSNewsSourceDialogState();
}

class _AddRSSNewsSourceDialogState extends State<AddRSSNewsSourceDialog> {
  final textController = TextEditingController();
  bool isImageFeed = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new RSS feed'),
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
                          newsHandler: NewsHandler.RSS,
                          feedUrl: textController.text,
                          websiteUrl: textController.text,
                          title: "RSS " +
                              Uri.parse(textController.text)
                                  .host
                                  .replaceAll("www.", ""),
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
