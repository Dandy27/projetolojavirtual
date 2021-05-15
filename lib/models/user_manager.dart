import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:projetolojavirtual/helpers/firebase_errors.dart';

import 'user.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      // print(result.user.uid);
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }}