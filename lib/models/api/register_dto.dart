// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';

class RegisterDTO {
    final String email;
    final String nickName;
    final String profileUrl;
    final String id;


    RegisterDTO({
        required this.email,
        required this.nickName,
        required this.profileUrl,
        this.id = "",
    });

  

    factory RegisterDTO.fromJson(Map<String, dynamic> json) => RegisterDTO(
        email: json["email"],
        nickName: json["nickName"],
        profileUrl: json["profileUrl"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "nickName": nickName,
        "profileUrl": profileUrl,
        "id": id,
    };

    Map<String, dynamic> toJsonFirebase() => {
        "email": email,
        "nickName": nickName,
        "profileUrl": profileUrl,
    };


    

  RegisterDTO copyWith({
    String? email,
    String? nickName,
    String? profileUrl,
  }) {
    return RegisterDTO(
      email: email ?? this.email,
      nickName: nickName ?? this.nickName,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'nickName': nickName,
      'profileUrl': profileUrl,
    };
  }


}
