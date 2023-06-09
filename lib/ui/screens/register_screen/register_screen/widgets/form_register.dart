import 'dart:io';

import 'package:chat_app/share/extensions.dart';
import 'package:chat_app/types/image_type.dart';
import 'package:chat_app/ui/navigation/app_router.dart';
import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';
import 'package:chat_app/ui/screens/register_screen/widgets/menu_select_image.dart';
import 'package:chat_app/ui/screens/register_screen/widgets/section_select_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class FormRegister extends ConsumerWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: ref.read(registerViewModel.notifier).formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("New Account",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: 15),
              const SectionPhotoProfile(),
              const SizedBox(height: 15),
                  const _InputNickName(),
              const SizedBox(height: 15),
              const _InputEmail(),
              const SizedBox(height: 15),
              const _InputPassword(),
              const SizedBox(height: 15),
              const _InputConfirmPassword(),
              const SizedBox(height: 40),
              const _ButtonRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputNickName extends ConsumerWidget {
  const _InputNickName({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     final isRegisterLoading =
        ref.watch(registerViewModel.select((value) => value.isLoading));

    return TextFormField(
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'Nick Name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
      keyboardType: TextInputType.name,
      onChanged: (value) =>
          ref.read(registerViewModel.notifier).onNickNameChanged(value),
      validator: (value) =>
          ref.read(registerViewModel.notifier).validateNickName(value),
      enabled: !isRegisterLoading,
    );
  }
}

class _ButtonRegister extends ConsumerWidget {
  const _ButtonRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRegisterLoading =
        ref.watch(registerViewModel.select((value) => value.isLoading));

    if (isRegisterLoading) {
      return const CircularProgressIndicator();
    }

    return ElevatedButton(
      onPressed: () {
        if (ref.read(registerViewModel.notifier).validate()) {
          ref.read(registerViewModel.notifier).onRegister(
              onSuccess: () => context.go(AppRouter.chat),
          );
        }
      },
      child: const Text('Register'),
    );
  }
}

class _InputConfirmPassword extends ConsumerWidget {
  const _InputConfirmPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(
        registerViewModel.select((value) => value.isConfirmPasswordVisible));

    final isRegisterLoading =
        ref.watch(registerViewModel.select((value) => value.isLoading));

    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () => ref
                .read(registerViewModel.notifier)
                .onToggleConfirmPasswordVisibility(),
          ),
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Confirm Password',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          ref.read(registerViewModel.notifier).onConfirmPasswordChanged(value),
      validator: (value) => ref
          .read(registerViewModel.notifier)
          .validatePassword(value: value, isConfirmPassword: true),
      obscureText: !isPasswordVisible,
      enabled: !isRegisterLoading,
    );
  }
}

class _InputPassword extends ConsumerWidget {
  const _InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible =
        ref.watch(registerViewModel.select((value) => value.isPasswordVisible));

    final isRegisterLoading =
        ref.watch(registerViewModel.select((value) => value.isLoading));

    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () => ref
                .read(registerViewModel.notifier)
                .onTogglePasswordVisibility(),
          ),
          labelText: 'Password',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          ref.read(registerViewModel.notifier).onPasswordChanged(value),
      validator: (value) =>
          ref.read(registerViewModel.notifier).validatePassword(value: value),
      obscureText: !isPasswordVisible,
      enabled: !isRegisterLoading,
    );
  }
}

class _InputEmail extends ConsumerWidget {
  const _InputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRegisterLoading =
        ref.watch(registerViewModel.select((value) => value.isLoading));

    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) =>
          ref.read(registerViewModel.notifier).onEmailChanged(value),
      validator: (value) =>
          ref.read(registerViewModel.notifier).validateEmail(value),
      enabled: !isRegisterLoading,
    );
  }
}
