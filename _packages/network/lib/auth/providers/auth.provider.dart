import 'package:firebase_auth/firebase_auth.dart';
import 'package:network/auth/repository/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.provider.g.dart';

@Riverpod(keepAlive: true)
Future<AuthRepositoryImpl> authProvider(AuthProviderRef ref) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  return AuthRepositoryImpl(auth: auth);
}
