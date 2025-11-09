import 'package:flutter_app/core/utils/type.dart';
import 'package:flutter_app/data/services/auth/auth_service.dart';

class AuthServiceImpl implements Authservice {
  @override
  FutureMap login() {
    return Future.value({
      "name": "John Doe",
      "email": "john.doe@example.com",
      "age": 30,
    });
  }

  @override
  Future<bool> logout() {
    return Future.value(true);
  }
}
