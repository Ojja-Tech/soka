import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class AppEnv {
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY')
  static const String firebaseAndroidApiKey = _AppEnv.firebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID')
  static const String firebaseAndroidAppId = _AppEnv.firebaseAndroidAppId;

  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID')
  static const String firebaseMessagingSenderId =
      _AppEnv.firebaseMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_PROJECT_ID')
  static const String firebaseProjectId = _AppEnv.firebaseProjectId;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET')
  static const String firebaseStorageBucket = _AppEnv.firebaseStorageBucket;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY')
  static const String firebaseIosAppId = _AppEnv.firebaseIosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID')
  static const String firebaseIosApiKey = _AppEnv.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID')
  static const String firebaseIosClientId = _AppEnv.firebaseIosClientId;

  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID')
  static const String firebaseIosBundleId = _AppEnv.firebaseIosBundleId;
}
