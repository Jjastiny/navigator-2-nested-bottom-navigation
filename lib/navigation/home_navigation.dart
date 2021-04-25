import 'package:flutter/material.dart';
import 'package:navigator2_nested_bottom_nav/screens/home/home_screen.dart';
import 'package:navigator2_nested_bottom_nav/screens/tasks/other_screen.dart';

import 'base/base_page.dart';

class HomeNavigation extends BasePage {

  HomeNavigation() : super([MaterialPage(child: HomeScreen())]);

  void openAnotherScreen() {
    addPage(MaterialPage(child: OtherScreen()));
    notifyListeners();
  }

}
