import 'package:flutter/material.dart';

import '../../models/Key.dart';
import '../../views/key_view.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<KeyModel> searchItems;

  CustomSearchDelegate(this.searchItems);

  @override
  List<Widget> buildActions(BuildContext context) {
    print(searchItems);
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchItems) {
      if (item.model.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.model);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(title: Text(result));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchItems) {
      if (item.model.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.model);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return InkWell(
            child: ListTile(
              title: Text(result),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KeyView(
                            model: searchItems.where((element) => element.model == result).first)));
              },
            ),
          );
        });
  }
}
