

import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterViewModel extends StateNotifier<RegisterState>{
  RegisterViewModel(super.state);



  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  validate() {
    return _formKey.currentState!.validate();
  }

  Future<void> onRegister() async {
    try {
      state = state.copyWith(isLoading: true);
      await Future.delayed(const Duration(seconds: 10), () { });
    } catch (e) {
      print(e);
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

  toggleConfirmPasswordVisibility() {
    state = state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
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

  onTogglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  onToggleConfirmPasswordVisibility() {
    state = state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
  }

  
}