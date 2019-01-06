import 'package:flutter/material.dart';
import 'package:vinegar/models/models.dart';
import 'dart:convert';

class AddAtomNewsSourceDialog extends StatefulWidget {
  _AddAtomNewsSourceDialogState createState() => _AddAtomNewsSourceDialogState();
}

class _AddAtomNewsSourceDialogState extends State<AddAtomNewsSourceDialog> {
  final textController = TextEditingController();
  bool isImageFeed = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new Atom feed'),
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
                          newsHandler: NewsHandler.ATOM,
                          feedUrl: textController.text,
                          websiteUrl: textController.text,
                          title: "Atom " +
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
