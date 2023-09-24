import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String uri = 'https://reqres.in/api/login';
  dynamic resBody;
  bool _loading = true;
  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  bool get loading => _loading;
  Future login(String email, String password, BuildContext context) async {
    setLoading(false);
    _loading = false;
    try {
      final res = await http
          .post(Uri.parse(uri), body: {"email": email, "password": password});

      if (res.statusCode == 200) {
        resBody = jsonDecode(res.body);
        _loading = true;

        if (kDebugMode) {
          print('Success' + res.body);
        }
      } else {
        _loading = true;
        if (kDebugMode) {
          print('Faild ' + res.statusCode.toString());
        }
        resBody = jsonDecode(res.body);
        _loading = true;

        print(resBody['error']);
        if (resBody['error'] == 'Missing password') {
          final snackBar = SnackBar(
            duration: Duration(seconds: 5),
            content: Center(child: const Text('Missing password')),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {}
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    return resBody;
  }
}
