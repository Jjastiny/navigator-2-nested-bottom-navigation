import 'package:flutter/cupertino.dart';

abstract class BasePage extends ChangeNotifier {
  List<Page> get pages => List.unmodifiable(_pages);
  List<Page> _pages = [];

  BasePage(this._pages);

  void addPage(Page page) {
    _pages.add(page);
    notifyListeners();
  }

  void removePage(Page page) {
    _pages.remove(page);
    notifyListeners();
  }
}
