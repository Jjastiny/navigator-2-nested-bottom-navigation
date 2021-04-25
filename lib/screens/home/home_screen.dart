import 'package:flutter/material.dart';
import 'package:navigator2_nested_bottom_nav/navigation/home_navigation.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeNavigation = Provider.of<HomeNavigation>(context, listen: false);

    return Scaffold(
        appBar: AppBar(title: Text("Home"),),
        body: MaterialButton(
          child: Text('Open another screen'),
          onPressed: () {
            homeNavigation.openAnotherScreen();
          },
        ));
  }
}
