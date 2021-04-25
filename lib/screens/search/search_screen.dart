import 'package:flutter/material.dart';
import 'package:navigator2_nested_bottom_nav/navigation/search_navigation.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeNavigation = Provider.of<SearchNavigation>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Search") ,),
      body: Container(
        child: Column(
          children: [
            MaterialButton(
              child: Text('Open another screen'),
              onPressed: () {
                homeNavigation.openAnotherScreen();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
