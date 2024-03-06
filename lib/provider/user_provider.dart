import 'package:flutter/material.dart';
import 'package:inno_hack/data/user_endpoints.dart';

class UserProvider extends ChangeNotifier {
  UserProvider();

  late final String uid;

  late String name;
  late String phone;
  late String email;
  late bool employee;

  Future<bool> createUser() async {
    return await createUserOnBackend(
        name: name, email: email, firebaseUserId: uid);
  }
}
