class AuthSession { const AuthSession({required this.userId, required this.email}); final String userId, email; }
abstract interface class AuthRepository {
  Stream<AuthSession?> get sessionChanges;
  Future<AuthSession> signIn({required String email, required String password});
  Future<AuthSession> signUp({required String email, required String password});
  Future<void> sendPasswordReset(String email);
  Future<void> signOut();
}
