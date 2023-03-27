abstract class AuthRepository {
  // login
  Future<void> loginWithEmailAndPassword(String username, String password);

  // register
  Future<void> signUpWithEmailAndPassword(String email, String password);

  // signIn with google
  Future<void> signInWithGoogle(String email);

  // signin with facebook
  Future<void> signInWithFacebook(String email);

  // signOut
  Future<void> signOut();
}
