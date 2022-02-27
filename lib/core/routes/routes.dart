import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_example/screens/home/home_page.dart';
import 'package:hive_example/screens/profile/profile_page.dart';

class AppRoutes {
  static generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (context) => ProfilePage(
            date: arguments,
          ),
        );
    }
  }
}
