import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice_demo/provider/favorite_provider.dart';
import 'package:provider_prectice_demo/screen/favorite/myfavorite_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Favorite Screen');
    }
    // final kFav = Provider.of<FavoriteModel>(context, listen: false);
    final arguments = (ModalRoute.of(context)?.settings.arguments) as List;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments[0]['Goutom'].toString()),
        actions: [
          Consumer<FavoriteModel>(
            builder: (context, value, child) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyFavoriteScreen()));
                },
                child: const Icon(Icons.favorite)),
          ),
          const SizedBox(width: 20)
        ],
        // centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => Consumer<FavoriteModel>(
              builder: (context, value, child) => Card(
                child: ListTile(
                  iconColor: Colors.red,
                  onTap: () {
                    if (value.selectItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }

                    if (kDebugMode) {
                      print(value.selectItem.length);

                      print(value.selectItem);
                    }

                    // print(selectItem);
                  },
                  leading: Text('Item ${index + 1}'),
                  trailing: value.selectItem.contains(index)
                      ? const Icon(Icons.favorite)
                      : const SizedBox(),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
