import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice_demo/res/provider/auth_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Loigin'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password', border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            Consumer<AuthProvider>(
                builder: (context, value, child) => MaterialButton(
                      minWidth: double.infinity,
                      color: Colors.amber,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        value.login(emailController.text.toString(),
                            passwordController.text.toString(), context);
                      },
                      child: Text('Login'),
                    )),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
