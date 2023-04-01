import 'package:core/errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  @override
  Future<void> loginWithEmailAndPassword(
    String username,
    String password,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
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
    } on Object catch (e) {
      throw Exception('Unknown Error');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw const MessageException('Google SignIn Failed');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);
    } on MessageException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':

          /// Thrown if there already exists an account with the email address asserted by the credential.
          /// Resolve this by calling [fetchSignInMethodsForEmail] and then asking the user to sign in using one of the returned providers. Once the user is signed in,
          /// the original credential can be linked to the user with [linkWithCredential].
          break;
        case 'invalid-credential':
          break;
        case 'operation-not-allowed':
          break;
        case 'user-disabled':
          break;
        default:
          break;
      }
    } on Object {
      throw Exception('Unknown Error');
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
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

  @override
  Future<void> signInWithFacebook(String email) {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }
}
