import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:network/auth/repository/auth_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class CustomMockFirebaseAuth extends Mock
    implements firebase_auth.FirebaseAuth {}

class FirebaseAuthSetup {
  late MockUser mockFirebaseUser;
  late firebase_auth.FirebaseAuth mockFirebaseAuth;
  FirebaseAuthSetup({bool signedIn = true}) {
    mockFirebaseUser = MockUser();
    mockFirebaseAuth = signedIn
        ? MockFirebaseAuth(signedIn: true, mockUser: mockFirebaseUser)
        : MockFirebaseAuth();
  }
}

void main() {
  group('testing getSignedInUser: ', () {
    test("signed in user exists", () async {
      // mock
      FirebaseAuthSetup mocks = FirebaseAuthSetup(signedIn: true);

      AuthRepositoryImpl firebaseAuthRepository =
          AuthRepositoryImpl(firebaseAuth: mocks.mockFirebaseAuth);

      // perform test
      var result = await firebaseAuthRepository.firebaseAuth.currentUser;

      // verify
      expect(result?.uid, equals(mocks.mockFirebaseUser.uid));
    });
  });

  test("testing signOut -- remove user reference", () async {
    // mock
    FirebaseAuthSetup mocks = FirebaseAuthSetup(signedIn: true);
    firebase_auth.FirebaseAuth mockFirebaseAuth = mocks.mockFirebaseAuth;
    AuthRepositoryImpl firebaseAuthRepository =
        AuthRepositoryImpl(firebaseAuth: mocks.mockFirebaseAuth);
    // perform test
    expect(mockFirebaseAuth.currentUser, equals(mocks.mockFirebaseUser));
    await firebaseAuthRepository.signOut();

    // verify
    expect(mockFirebaseAuth.currentUser, isNull);
  });
}
