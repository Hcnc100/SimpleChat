import 'package:chat_app/ui/screens/login_screen/view_model/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default("") String email,
    @Default("") String password,
    @Default(false) bool isLoading,
    @Default(false) bool isPasswordVisible,
  }) = _LoginState;
}

final loginViewModel = StateNotifierProvider<LoginViewMode, LoginState>(
    (ref) => LoginViewMode(LoginState()));
