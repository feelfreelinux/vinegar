import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';

class AddNewsSourceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      padding: EdgeInsets.all(7.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              "ADD NEW SOURCE",
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconAddNewButton(Icons.add_box, "REDDIT",
                  () => _showDialog(context, AddRedditNewsSourceDialog())),
              _iconAddNewButton(Icons.rss_feed, "RSS",
                  () => _showDialog(context, AddRSSNewsSourceDialog())),
              _iconAddNewButton(Icons.rss_feed, "ATOM",
                  () => _showDialog(context, AddAtomNewsSourceDialog())),
            ],
          ),
          Container(
            width: 34.0,
            height: 34.0,
            child: FloatingActionButton(
              child: Icon(Icons.close),
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).textTheme.caption.color,
              elevation: 0.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ));
  }

  void _showDialog(BuildContext context, Widget body) {
    showDialog(context: context, builder: (context) => body);
  }

  Widget _iconAddNewButton(
      IconData icon, String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            elevation: 1.0,
            highlightElevation: 8.0,
            onPressed: onPressed,
            child: Icon(icon),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
