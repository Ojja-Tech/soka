import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth auth;

  AuthRepositoryImpl({
    required this.auth,
  });

  Stream<User?> get authStateChange => auth.authStateChanges();

  @override
  Future<void> loginWithEmailAndPassword(
      String username, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: username, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw Exception('No Internet Connection');
      } else if (e.code == "invalid-email" ||
          e.code == "wrong-password" ||
          e.code == "user-not-found") {
        throw Exception('Invalid username or Password');
      } else {
        throw Exception('Unknown Error');
      }
    }
  }

  @override
  Future<void> signInWithGoogle(String email) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await auth.signInWithCredential(credential);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw Exception('No Internet Connection');
      } else if (e.code == "email-already-in-use") {
        throw Exception('Email already in use');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      } else if (e.code == 'weak-password') {
        throw Exception('Weak Password');
      } else {
        throw Exception('Unknown Error ');
      }
    }
  }
}
