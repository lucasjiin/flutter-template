import 'package:flutter/material.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Initializer extends ConsumerStatefulWidget {
  final Widget child;

  const Initializer({
    super.key,
    this.child = const SizedBox.shrink(),
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitializerState();
}

class _InitializerState extends ConsumerState<Initializer> {
  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(authRepository);

    if (userProfile == null) {
      return _buildLoading();
    } else {
      return widget.child;
    }
  }

  Widget _buildLoading() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: CircularProgressIndicator(),
    );
  }
}
