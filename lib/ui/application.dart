import 'package:flutter/material.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:flutter_app/ui/initializer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      builder: (context, child) {
        return Initializer(
          child: child!,
        );
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
