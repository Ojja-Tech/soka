import 'package:core/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension FirebaseUserX on firebase_auth.User? {
  User toDomain() {
    if (this == null) {
      return User.anonymous;
    } else {
      return User(
        id: this!.uid,
        phoneNumber: this?.phoneNumber,
        isPhoneNumberVerified: this?.phoneNumber != null,
        email: this?.email,
        isEmailVerified: this!.emailVerified,
        getIdToken: this!.getIdToken,
        joinDate: this!.metadata.creationTime,
      );
    }
  }
}
