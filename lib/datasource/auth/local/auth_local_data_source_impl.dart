
import 'dart:convert';

import 'package:chat_app/models/auth_data/auth_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  final String _keyAuthData="auth_data";

  AuthLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<void> saveAuthData(AuthData authData) {
    return _sharedPreferences.setString(_keyAuthData, json.encode(authData.toJson(),),);
  }
    

  @override
  Future<AuthData?> getAuthData() {
    final saveData = _sharedPreferences.getString(_keyAuthData);
    if (saveData != null) {
      final authData = AuthData.fromJson(json.decode(saveData));
      return Future.value(authData);
    } else {
      return Future.value(null);
    }
  }
  
  @override
  Future<void> clearAuthData() => _sharedPreferences.remove(_keyAuthData);
}