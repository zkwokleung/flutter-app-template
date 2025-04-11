import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> authStateChanges();
  Future<void> signUp(String email, String password);
  Future<void> login(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> logout();
}
