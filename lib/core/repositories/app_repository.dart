import 'dart:async';


import '../app_init.dart';
import '../constants.dart';

class AppRepository {
  String? projectVersion;
  String? appName;
  String? projectCode;
  String? _firebaseToken;
  String? _token;

   dynamic _offersData;

  // ignore: empty_constructor_bodies
  AppRepository._() {}

  String? get token => _token;

  factory AppRepository() => _instance;

  static final AppRepository _instance = AppRepository._();

  String? get firebaseToken => _firebaseToken;

  // ignore: unnecessary_getters_setters
  dynamic get offersData => _offersData;

  set offersData(dynamic value) {
    _offersData = value;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    _token = null;
    AppInit.clearHive();
    return;
  }

  Future<void> persistToken(String? token) async {
    /// write to keystore/keychain
    _token = token;
    return await AppInit.hiveSettingBox
        .put("$storageKey$storageTokenSuffix", token);
  }

Future<void> updateStorageOnboarding() async {
    return  await AppInit.hiveSettingBox.put("$storageKey$storageOnboardingRead", true);
  }
  
 Future<bool> hasAlreadyOnboarding() async {
    return await AppInit.hiveSettingBox.containsKey("$storageKey$storageOnboardingRead");
  }




  Future<String?> getToken() async {
    return await AppInit.hiveSettingBox.get("$storageKey$storageTokenSuffix");
  }

  Future<bool> hasToken() async {
    String? token = AppInit.hiveSettingBox
        .get("$storageKey$storageTokenSuffix", defaultValue: null);
    return token != null && token.isNotEmpty;
  }



  Future<void> logOut() async {
    await deleteToken();
  }
}
