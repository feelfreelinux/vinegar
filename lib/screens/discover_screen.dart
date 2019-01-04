import 'package:flutter/material.dart';
import 'package:vinegar/widgets/widgets.dart';
import 'package:vinegar/models/models.dart';
import 'package:vinegar/api/api.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createListView(context),
    );
  }

  Widget _createListView(BuildContext context) {
    var items = [guardianUS, hackerNews, bbc, hackerNews, bbc, guardianUS];
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(6, (index) {
          return NewsSourceWidget(newsSource: items[index]);
        }));
  }
}
