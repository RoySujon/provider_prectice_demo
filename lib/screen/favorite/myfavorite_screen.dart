import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice_demo/provider/favorite_provider.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final favProvider = Provider.of<FavoriteModel>(context, listen: false);
    if (kDebugMode) {
      print('My Favorite Screen');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Item'),
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: value.selectItem.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  iconColor: Colors.red,
                  onTap: () {
                    value.removeItem(value.selectItem[index]);

                    if (kDebugMode) {
                      print(value.selectItem);
                    }

                    // print(selectItem);
                  },
                  leading: Text('Item ${value.selectItem[index] + 1}'),
                  trailing: value.selectItem.contains(value.selectItem[index])
                      ? const Icon(Icons.favorite)
                      : const SizedBox(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
