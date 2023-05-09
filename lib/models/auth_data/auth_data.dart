


import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.freezed.dart';

part 'auth_data.g.dart';

@freezed
class AuthData with _$AuthData {
  const factory AuthData({
    required String email,
    required String id,
    required String nickName,
    required String profileUrl,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  factory AuthData.fromFirebase({required Map<String, dynamic> json,required String id}) => AuthData(
        email: json["email"],
        nickName: json["nickName"],
        profileUrl: json["profileUrl"],
        id: id,
      );
}