import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';

class AuthRepositoyImpl extends AuthRepository {
  AuthRepositoyImpl(super.authService);

  @override
  UserProfile? build() {
    ref.onDispose(() {});

    Future.delayed(Duration(milliseconds: 1000), () {
      state = UserProfile();
    });

    return null;
  }

  @override
  Future<bool> login() async {
    final result = UserProfile.fromMap(await authService.login());
    state = result;
    return Future.value(result.name.isNotEmpty);
  }

  @override
  Future<bool> logout() async {
    bool result = await authService.logout();
    state = const UserProfile();
    return Future.value(result);
  }
}
