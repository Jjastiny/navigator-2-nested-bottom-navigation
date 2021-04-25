import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator2_nested_bottom_nav/navigation/base/base_page.dart';
import 'package:navigator2_nested_bottom_nav/screens/search/search_screen.dart';
import 'package:navigator2_nested_bottom_nav/screens/tasks/other_screen.dart';

class SearchNavigation extends BasePage {
  SearchNavigation()
      : super([
          MaterialPage(child: SearchScreen()),
        ]);

  void openAnotherScreen() {
    addPage(MaterialPage(child: OtherScreen()));
    notifyListeners();
  }
}
