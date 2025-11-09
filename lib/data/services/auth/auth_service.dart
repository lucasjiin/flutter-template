import 'package:flutter_app/core/type.dart';
import 'package:flutter_app/data/services/auth/auth_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Authservice {
  FutureMap login();
  Future<bool> logout();
}

final authService = Provider<Authservice>((ref) {
  return AuthServiceImpl();
});
