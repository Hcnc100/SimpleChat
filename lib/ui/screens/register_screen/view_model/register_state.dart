


import 'package:chat_app/ui/screens/register_screen/view_model/register_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState{

    factory RegisterState({
        @Default("") String email,
        @Default("") String password,
        @Default("") String confirmPassword,
        @Default(false) bool isLoading,
        @Default(false) bool isPasswordVisible,
        @Default(false) bool isConfirmPasswordVisible,
    }) = _RegisterState;

}



final registerViewModel = StateNotifierProvider<RegisterViewModel, RegisterState>(
    (ref) => RegisterViewModel(RegisterState()));