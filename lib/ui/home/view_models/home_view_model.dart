import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<UserProfile> {
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

  Future<bool> logout() {
    return ref.read(authRepository.notifier).logout();
  }
}

final homeViewModel = NotifierProvider.autoDispose<HomeViewModel, UserProfile>(HomeViewModel.new);
