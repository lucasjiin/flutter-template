import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends Notifier<UserProfile> {
  @override
  UserProfile build() {
    final userProfile = ref.watch(authRepository) ?? UserProfile();

    ref.onDispose(() {});

    return UserProfile(
      name: userProfile.name,
      email: userProfile.email,
      age: userProfile.age,
    );
  }

  Future<bool> login() {
    return ref.read(authRepository.notifier).login();
  }

  Future<bool> logout() {
    return ref.read(authRepository.notifier).logout();
  }
}

final authViewModel = NotifierProvider.autoDispose<AuthViewModel, UserProfile>(AuthViewModel.new);
