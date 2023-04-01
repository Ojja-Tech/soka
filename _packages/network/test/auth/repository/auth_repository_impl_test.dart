import 'package:core/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:network/auth/repository/auth_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/google_sign_in_mocks_base.dart';

class CustomMockFirebaseAuth extends Mock
    implements firebase_auth.FirebaseAuth {}

class FirebaseAuthSetup {
  late MockUser mockFirebaseUser;
  late firebase_auth.FirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn googleSignIn;

  FirebaseAuthSetup({bool signedIn = true}) {
    mockFirebaseUser = MockUser();
    mockFirebaseAuth = signedIn
        ? MockFirebaseAuth(signedIn: true, mockUser: mockFirebaseUser)
        : MockFirebaseAuth();
    googleSignIn = MockGoogleSignIn();
  }
}

void main() {
  group('testing getSignedInUser: ', () {
    test("signed in user exists", () async {
      // mock
      FirebaseAuthSetup mocks = FirebaseAuthSetup(signedIn: true);

      AuthRepositoryImpl firebaseAuthRepository = AuthRepositoryImpl(
        firebaseAuth: mocks.mockFirebaseAuth,
        googleSignIn: mocks.googleSignIn,
      );

      // perform test
      var result = firebaseAuthRepository.firebaseAuth.currentUser;

      // verify
      expect(result?.uid, equals(mocks.mockFirebaseUser.uid));
    });
  });

  test("testing signOut -- remove user reference", () async {
    // mock
    FirebaseAuthSetup mocks = FirebaseAuthSetup(signedIn: true);
    firebase_auth.FirebaseAuth mockFirebaseAuth = mocks.mockFirebaseAuth;
    AuthRepositoryImpl firebaseAuthRepository = AuthRepositoryImpl(
      firebaseAuth: mocks.mockFirebaseAuth,
      googleSignIn: mocks.googleSignIn,
    );
    // perform test
    expect(mockFirebaseAuth.currentUser, equals(mocks.mockFirebaseUser));
    await firebaseAuthRepository.signOut();

    // verify
    expect(mockFirebaseAuth.currentUser, isNull);
  });

  test("should fail when user cancels google sign in", () async {
    // mock
    FirebaseAuthSetup mocks = FirebaseAuthSetup(signedIn: false);

    mocks.googleSignIn.setIsCancelled(true);

    AuthRepositoryImpl firebaseAuthRepository = AuthRepositoryImpl(
      firebaseAuth: mocks.mockFirebaseAuth,
      googleSignIn: mocks.googleSignIn,
    );

    // verify
    expect(
      firebaseAuthRepository.signInWithGoogle(),
      throwsA(isA<MessageException>()),
    );
  });
}
