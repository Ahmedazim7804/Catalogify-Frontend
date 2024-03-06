import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inno_hack/data/user_endpoints.dart';
import 'package:inno_hack/models/user.dart' as MyUser;

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  needToFinishSignup,
  waiting,
}

class AuthListen extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late final StreamSubscription<dynamic> subscription;
  MyUser.User? userx;

  AuthenticationStatus status = AuthenticationStatus.waiting;

  AuthListen() {
    notifyListeners();
    listenToFirebaseAuth();
  }

  void listenToFirebaseAuth() async {
    subscription = firebaseAuth.authStateChanges().listen((user) async {
      if (user != null) {
        bool existOnBackend = await checkUser();

        if (existOnBackend) {
          final backendUser = await getUser();

          userx = MyUser.User(
              email: backendUser['email'],
              name: backendUser['name'],
              fireabseId: backendUser['id']);

          status = AuthenticationStatus.authenticated;
        } else {
          status = AuthenticationStatus.needToFinishSignup;
        }
      } else {
        status = AuthenticationStatus.unauthenticated;
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }
}
