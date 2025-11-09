import 'package:flutter_app/data/repositories/auth_repositoy_impl.dart';
import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository extends Notifier<UserProfile?> {
  Future<bool> login();
  Future<bool> logout();
}

final authRepository = NotifierProvider.autoDispose<AuthRepository, UserProfile?>(() {
  return AuthRepositoyImpl();
});
