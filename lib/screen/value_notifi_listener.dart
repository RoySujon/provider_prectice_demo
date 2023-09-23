import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('builder');
    }
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (context, value, child) => Text(_counter.value.toString()),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) => TextField(
                obscureText: _toggle.value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (_toggle.value == true) {
                            _toggle.value = false;
                          } else {
                            _toggle.value = true;
                          }
                        },
                        icon: Icon(_toggle.value
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: 'Password',
                    border: const OutlineInputBorder()),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          // print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
