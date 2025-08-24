import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/screens/login/widget/login_button.dart';
import 'package:spotify_app/widgets/header.dart';
import 'package:spotify_app/widgets/custom_textfield.dart';
import 'package:spotify_app/states/bloc/auth_bloc.dart';
import 'package:spotify_app/utils/show_custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              switch (state) {
                case AuthError error:
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                  showCustomSnackbar(context, error.message);

                case AuthLoading _:
                  if (mounted) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                case Authenticated state:
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                  showCustomSnackbar(
                    context,
                    "Welcome back, ${state.user.email}!",
                    isSuccess: true,
                  );
                  // Navigate to home screen on successful login
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/root',
                    (route) => false,
                  );

                case Unauthenticated _:
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
              }
            },
            builder: (context, state) {
              final authCubit = context.read<AuthCubit>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(pageTitle: "Log into your account"),
                  SizedBox(height: 40),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  CustomTextfield(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  CustomTextfield(
                    isPassword: true,
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _handleLogin(authCubit),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: isLoading ? null : () => _handleLogin(authCubit),
                        child: LoginButton(isActive: !isLoading),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleLogin(AuthCubit authCubit) {
    // Validate input fields
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty) {
      showCustomSnackbar(context, "Please enter your email");
      return;
    }

    if (password.isEmpty) {
      showCustomSnackbar(context, "Please enter your password");
      return;
    }

    if (!isEmailValid(email)) {
      showCustomSnackbar(context, "Please enter a valid email address");
      return;
    }

    // Trigger login using the app-level AuthCubit
    authCubit.signIn(email, password);
  }
}
