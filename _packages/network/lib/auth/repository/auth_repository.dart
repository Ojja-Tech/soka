abstract class AuthRepository {
  // login
  Future<void> loginWithEmailAndPassword(String username, String password);

  // register
  Future<void> signUpWithEmailAndPassword(String email, String password);

  // signIn with google
  Future<void> signInWithGoogle(String email);

  // signOut
  Future<void> signOut();
}
