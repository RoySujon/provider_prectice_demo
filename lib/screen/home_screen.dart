import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_prectice_demo/provider_model.dart';
import 'package:provider_prectice_demo/res/routes/route_name.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List slectItem;
  double val = 1.0;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('HomeScreen');
    }
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ProviderDemo>(
            builder: (context, value, child) => Text(value.count.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteName.favoriteScreen, arguments: [
            {'Goutom': 'ROY'}
          ]);
        },
      ),
      body: Column(
        children: [
          Center(
            child: Consumer<ProviderDemo>(
              builder: (context, val, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 100,
                        color: Colors.red.withOpacity(val.opacity),
                      )),
                      Expanded(
                          child: Container(
                        height: 100,
                        color: Colors.green.withOpacity(val.opacity),
                      )),
                    ],
                  ),
                  Slider(
                    value: val.opacity,
                    onChanged: (value) {
                      val.changOpacity(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          Consumer<ProviderDemo>(
            builder: (context, value, child) => Text(value.opacity.toString()),
          )
        ],
      ),
    );
  }
}
