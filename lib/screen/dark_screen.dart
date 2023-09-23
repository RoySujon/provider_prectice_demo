import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice_demo/res/provider/theme_changer.dart';
import 'package:provider_prectice_demo/res/routes/route_name.dart';

class DarkScreen extends StatelessWidget {
  const DarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    if (kDebugMode) {
      print(themeChanger.modeName);
    }
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.homeScreen);
                },
                icon: const Icon(Icons.home))
          ],
          title: Consumer<ThemeChanger>(
              builder: (context, value, child) => Text(value.modeName))),
      body: Column(
        children: [
          Consumer<ThemeChanger>(
            builder: (context, value, child) => Switch(
              value: value.value,
              onChanged: (val) {
                if (val == true) {
                  value.switchThemeChanger(ThemeMode.dark, val, 'Dark Mode');
                } else {
                  value.switchThemeChanger(ThemeMode.light, val, 'Light Mode');
                  val = value.value;
                }
              },
            ),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: (value) =>
                themeChanger.raioThemeChanger(value, 'Light Mode'),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: (value) =>
                themeChanger.raioThemeChanger(value, 'Dark Mode'),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: (value) =>
                themeChanger.raioThemeChanger(value, 'System Mode'),
          ),
        ],
      ),
      floatingActionButton: Consumer<ThemeChanger>(
        builder: (context, value, child) => FloatingActionButton(
          onPressed: () {
            if (value.themeMode == ThemeMode.dark) {
              value.setTheme(ThemeMode.light, 'Light Mode');
            } else if (value.themeMode == ThemeMode.light) {
              value.setTheme(ThemeMode.dark, 'Dark Mode');
            } else {
              value.setTheme(ThemeMode.system, 'System Mode');
            }
          },
        ),
      ),
    );
  }
}
