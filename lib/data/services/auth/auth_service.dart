import 'package:flutter_app/core/type.dart';

abstract class Authservice {
  FutureMap login();
  Future<bool> logout();
}
