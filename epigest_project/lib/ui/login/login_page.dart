import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card.filled(
              child: Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Column(
                  spacing: 15,
                  children: [
                    Text("Login"),
                    FilledButton(onPressed: () {}, child: Text("Logar")),
                    TextButton(onPressed: () {}, child: Text("Logar")),
                    OutlinedButton(onPressed: () {}, child: Text("Logar")),
                    FilledButton.tonal(onPressed: () {}, child: Text("Logar")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
