import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_prectice_demo/provider/favorite_provider.dart';
import 'package:provider_prectice_demo/provider_model.dart';
import 'package:provider_prectice_demo/res/provider/theme_changer.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider(create: (context) => ProviderDemo()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
        ChangeNotifierProvider(create: (context) => ThemeChanger()),
      ];
}
