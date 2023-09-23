import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice_demo/res/provider/provider_list.dart';
import 'package:provider_prectice_demo/res/provider/theme_changer.dart';
import 'package:provider_prectice_demo/res/routes/routes.dart';
import 'package:provider_prectice_demo/screen/login/login_view.dart';

import 'package:provider_prectice_demo/screen/value_notifi_listener.dart';
// import 'package:provider_prectice_demo/screen/favorite/favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers(),
      child: Builder(builder: (context) {
        return Consumer<ThemeChanger>(
          builder: (context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: value.themeMode,
            darkTheme: ThemeData(brightness: Brightness.dark),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
            ),
            // home: const DarkScreen(),

            home: LoginView(),
            routes: AppRoutes.routes(),
          ),
        );
      }),
    );
  }
}
