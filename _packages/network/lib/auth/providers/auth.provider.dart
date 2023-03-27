import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:network/auth/repository/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.provider.g.dart';

@Riverpod(keepAlive: true)
Future<AuthRepositoryImpl> authProvider(AuthProviderRef ref) async {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  final googleSignIn = ref.read(googleSignInProvider);
  
  return AuthRepositoryImpl(
    firebaseAuth: firebaseAuth,
    googleSignIn: googleSignIn,
  );
}

@Riverpod(keepAlive: true)
GoogleSignIn googleSignIn(GoogleSignInRef ref) {
  return GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}
