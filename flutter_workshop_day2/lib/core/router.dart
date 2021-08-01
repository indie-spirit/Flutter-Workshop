// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:flutter_workshop_day2/core/router_constants.dart';

import 'package:flutter_workshop_day2/views/home/home_view.dart' as view0;
import 'package:flutter_workshop_day2/views/add_image/add_image_view.dart' as view1;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view0.HomeView());
      case addImageViewRoute:
        return MaterialPageRoute(builder: (_) => view1.AddImageView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}