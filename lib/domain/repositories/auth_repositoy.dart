import 'package:flutter_app/data/repositories/auth_repositoy_impl.dart';
import 'package:flutter_app/data/services/auth/auth_service.dart';
import 'package:flutter_app/data/services/auth/auth_service_impl.dart';
import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository extends Notifier<UserProfile?> {
  Authservice authService;

  AuthRepository(this.authService);

  Future<bool> login();
  Future<bool> logout();
}

final authRepository = NotifierProvider.autoDispose<AuthRepository, UserProfile?>(() {
  return AuthRepositoyImpl(AuthServiceImpl());
});
