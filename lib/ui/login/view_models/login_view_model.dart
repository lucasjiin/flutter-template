import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends Notifier<UserProfile> {
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
}

final loginViewModel = NotifierProvider.autoDispose<LoginViewModel, UserProfile>(LoginViewModel.new);
