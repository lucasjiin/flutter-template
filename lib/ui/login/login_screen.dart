import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/view_models/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _login,
              child: Row(
                spacing: 15,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login"),
                  Icon(Icons.login),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    final result = await ref.read(loginViewModel.notifier).login();
    if (result && mounted) {
      GoRouter.of(context).go("/");
    }
  }
}
