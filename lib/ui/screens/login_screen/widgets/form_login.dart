import 'package:chat_app/ui/screens/login_screen/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: ref.read(loginViewModel.notifier).formKey,
          child: Column(children: [
            Text('Login', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            const _InputEmail(),
            const SizedBox(height: 20),
            const _InputPassword(),
            const SizedBox(height: 20),
            const _ButtonLogin(),
          ]),
        ),
      ),
    );
  }
}

class _ButtonLogin extends ConsumerWidget {
  const _ButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginLoading =
        ref.watch(loginViewModel.select((value) => value.isLoading));
    
    if (isLoginLoading)  {
      return const CircularProgressIndicator();
    }
    

    return FilledButton(
        onPressed: () {
          if (ref.read(loginViewModel.notifier).validate()) {
            ref.read(loginViewModel.notifier).onLogin();
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Login',
          ),
        ));
  }
}

class _InputPassword extends ConsumerWidget {
  const _InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible =
        ref.watch(loginViewModel.select((value) => value.isPasswordVisible));

        final isLoading = ref.watch(loginViewModel.select((value) => value.isLoading));

    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon:  Icon( isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () =>
              ref.read(loginViewModel.notifier).togglePasswordVisibility(),
        ),
      ),
      onChanged: (value) =>
          ref.read(loginViewModel.notifier).onPasswordChanged(value),
      validator: (value) =>
          ref.read(loginViewModel.notifier).validatePassword(value),
      obscureText: !isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      enabled: !isLoading,
    );
  }
}

class _InputEmail extends ConsumerWidget {
  const _InputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isLoading = ref.watch(loginViewModel.select((value) => value.isLoading));

    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        prefixIcon: Icon(Icons.email),
      ),
      onChanged: (value) =>
          ref.read(loginViewModel.notifier).onEmailChanged(value),
      validator: (value) =>
          ref.read(loginViewModel.notifier).validateEmail(value),
      keyboardType: TextInputType.emailAddress,
      enabled: !isLoading,  
    );
  }
}
