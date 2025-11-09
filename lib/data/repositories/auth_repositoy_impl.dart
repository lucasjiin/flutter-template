import 'package:flutter_app/data/services/auth/auth_service.dart';
import 'package:flutter_app/domain/models/user_profile_model.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';

class AuthRepositoyImpl extends AuthRepository {
  AuthRepositoyImpl();

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
    final result = UserProfile.fromMap(await ref.read(authService).login());
    state = result;
    return Future.value(result.name.isNotEmpty);
  }

  @override
  Future<bool> logout() async {
    bool result = await ref.read(authService).logout();
    state = const UserProfile();
    return Future.value(result);
  }
}
