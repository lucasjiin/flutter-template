// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserProfile {
  final String name;
  final String email;
  final int age;

  const UserProfile({
    this.name = "",
    this.email = "",
    this.age = -1,
  });

  UserProfile copyWith({String? name, String? email, int? age}) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'age': age};
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserProfile(name: $name, email: $email, age: $age)';

  @override
  bool operator ==(covariant UserProfile other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ age.hashCode;
}
