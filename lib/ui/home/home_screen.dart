import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home/view_models/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewData = ref.watch(homeViewModel);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome, ${viewData.name}"),
            Text(viewData.email),
            ElevatedButton(
              onPressed: _logout,
              child: Row(
                spacing: 15,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Logout"),
                  Icon(Icons.logout),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout() async {
    final result = await ref.read(homeViewModel.notifier).logout();
    if (result && mounted) {
      GoRouter.of(context).go("/");
    }
  }
}
