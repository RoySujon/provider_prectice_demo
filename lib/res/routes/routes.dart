import 'package:flutter/material.dart';
import 'package:provider_prectice_demo/res/routes/route_name.dart';
import 'package:provider_prectice_demo/screen/dark_screen.dart';
import 'package:provider_prectice_demo/screen/favorite/favorite_screen.dart';
import 'package:provider_prectice_demo/screen/home_screen.dart';
import 'package:provider_prectice_demo/screen/login/login_view.dart';
import 'package:provider_prectice_demo/screen/value_notifi_listener.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes() => {
        RouteName.homeScreen: (context) => const HomeScreen(),
        RouteName.favoriteScreen: (context) => const FavoriteScreen(),
        RouteName.darkScreen: (context) => const DarkScreen(),
        RouteName.notifyListenerScreen: (context) => NotifyListenerScreen(),
        RouteName.loginView: (context) => LoginView(),
      };
}
