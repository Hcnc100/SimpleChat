import 'package:chat_app/domain/auth/auth_repository.dart';
import 'package:chat_app/ui/screens/login_screen/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginViewModel extends StateNotifier<LoginState> {

  final AuthRepository _authRepository;

  LoginViewModel(LoginState state,{required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(state);

  
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> onLogin() async {
    try {
      state = state.copyWith(isLoading: true);
      await _authRepository.login(state.email, state.password);
      Fluttertoast.showToast(msg: "Login Successfull");
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Login Failed");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

  if (value.length > 15) {
    return 'Password must be less than 15 characters';
  }

    return null;
  }

  togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  validate() {
    final isValidate = _formKey.currentState!.validate();
    if(!isValidate){
      Fluttertoast.showToast(msg: "Please fill in the form correctly");
    }
    return isValidate;
  }

  Future<void> logout() async {
      try {
        state = state.copyWith(isLoading: true);
       await  _authRepository.logout();

      } catch (e) {
        print(e);
      }
      finally{
        state = state.copyWith(isLoading: false);
      }
  }
}
