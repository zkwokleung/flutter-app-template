class AuthState {
  final String? email;
  final bool isAuthenticated;

  const AuthState._(this.email, this.isAuthenticated);

  const AuthState.authenticated(String email) : this._(email, true);
  const AuthState.unauthenticated() : this._(null, false);
}
