import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  User currentUser();
  Future<User> signInAnonymously();
  Future<User> signInwithGoogle();
  Future<User> signInwithFacebook();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User currentUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user;
  }

  @override
  Future<User> signInwithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return authResult.user;
      } else {
        throw PlatformException(
          code: 'Error_missing_google_auth_token',
          message: 'missing auth token',
        );
      }
    } else {
      throw PlatformException(
        code: 'Error_aborted_by_user',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<User> signInwithFacebook() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(
      ['public_profile'],
    );
    if (result.accessToken != null) {
      final authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.credential(
          result.accessToken.token,
        ),
      );
      return authResult.user;
    } else {
      throw PlatformException(
        code: 'Error_aborted_by_user',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookSignIn = FacebookLogin();
    await facebookSignIn.logOut();
    await _firebaseAuth.signOut();
  }
}
