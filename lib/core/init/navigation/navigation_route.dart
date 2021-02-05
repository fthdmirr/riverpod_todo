import 'package:flutter/material.dart';
import 'package:riverpod_todo/view/todo/view/todo_page.dart';

import '../../components/page/page_not_found.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TODO_PAGE:
        return _normalNavigate(TodoPage());
      default:
        return _normalNavigate(PageNotFound());
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
