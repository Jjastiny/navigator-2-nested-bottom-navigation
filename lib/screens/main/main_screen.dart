import 'package:flutter/material.dart';
import 'package:navigator2_nested_bottom_nav/navigation/base/base_page.dart';
import 'package:navigator2_nested_bottom_nav/navigation/home_navigation.dart';
import 'package:navigator2_nested_bottom_nav/navigation/search_navigation.dart';
import 'package:provider/provider.dart';

enum TabItem { home, search, add, profile, settings }

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final HomeNavigation _homeNavigation = HomeNavigation();
  final SearchNavigation _searchNavigation = SearchNavigation();

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();
        return isFirstInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(_homeNavigation, 0),
            _buildOffstageNavigator(_searchNavigation, 1),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search")
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator<T extends BasePage>(T navigation, int index) {
    return Offstage(
      offstage: index != _selectedIndex,
      child: ChangeNotifierProvider.value(
          value: navigation,
          child: Consumer<T>(
            builder: (context, value, child) {
              return Navigator(
                key: _navigatorKeys[index],
                pages: (value).pages,
                onPopPage: (route, result) {
                  value.removePage(route.settings);
                  return route.didPop(result);
                },
              );
            },
          )),
    );
  }
}
