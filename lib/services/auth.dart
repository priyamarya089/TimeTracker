import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  User currentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
