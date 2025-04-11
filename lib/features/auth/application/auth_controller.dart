import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_state.dart';
import '../infrastructure/firebase_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref.read(authRepositoryProvider));
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _repo;
  AuthController(this._repo) : super(const AuthState.unauthenticated()) {
    _repo.authStateChanges().listen((user) {
      state = user != null
          ? AuthState.authenticated(user.email ?? '')
          : const AuthState.unauthenticated();
    });
  }

  Future<void> login(String email, String password) async {
    await _repo.login(email, password);
  }

  Future<void> signUp(String email, String password) async {
    await _repo.signUp(email, password);
  }

  Future<void> signInWithGoogle() async {
    await _repo.signInWithGoogle();
  }

  Future<void> logout() async {
    await _repo.logout();
  }
}
