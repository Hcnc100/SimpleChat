import 'dart:io';

import 'package:chat_app/domain/auth/auth_repository.dart';
import 'package:chat_app/models/server_exception.dart';
import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewModel extends StateNotifier<RegisterState> {
  final AuthRepository _authRepository;

  RegisterViewModel(state, {required AuthRepository authRepository})
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

  void onConfirmPasswordChanged(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  validate() {
    if (state.imageProfile == null) {
      Fluttertoast.showToast(msg: "Please select image");
      return false;
    }
    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: "Please fill the form correctly");
      return false;
    }
    return true;
  }

  Future<void> onRegister(
   { required VoidCallback onSuccess,}
  ) async {
    try {
      state = state.copyWith(isLoading: true);

      await _authRepository.createAccount(state);
      
      Fluttertoast.showToast(msg: "Register Successfull");

      onSuccess();
      } on ServerException catch (e) {
      print(e);
      Fluttertoast.showToast(msg:  e.message);
    }catch (e) {
      Fluttertoast.showToast(msg: "Logout Failed");
      print(e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  validatePassword({String? value, bool isConfirmPassword = false}) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (value.length > 15) {
      return 'Password must be less than 15 characters';
    }

    if (isConfirmPassword && value != state.password) {
      return 'Password does not match';
    }
    return null;
  }

  togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  toggleConfirmPasswordVisibility() {
    state = state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
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
    state = state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
  }

  void onImageChanged(File file) {
    state = state.copyWith(imageProfile: file);
  }

  onNickNameChanged(String value) {
    state = state.copyWith(nickName: value);
  }

  validateNickName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.length < 3) {
      return 'Nick Name must be at least 3 characters';
    }

    if (value.length > 15) {
      return 'Nick Name must be less than 15 characters';
    }

    return null;
  }
}
