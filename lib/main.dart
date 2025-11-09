import 'package:flutter/material.dart';
import 'package:flutter_app/ui/application.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class Logger extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    print("Add Provider: ${context.provider}");
    super.didAddProvider(context, value);
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    print("Dispose Provider: ${context.provider}");
    super.didDisposeProvider(context);
  }

  // @override
  // void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
  //   print("Update Provider: ${context.provider}");
  //   super.didUpdateProvider(context, previousValue, newValue);
  // }
}

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: Application(),
    ),
  );
}
