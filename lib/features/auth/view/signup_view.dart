import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/core/utils.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/features/auth/view/login_view.dart';
import 'package:beebeer_app2/features/auth/widgets/auth_field.dart';
import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    if (passwordController.text != confirmPasswordController.text) {
      showSnackBar(context, "Password does not match. Please re-type again.");
    } else {
      final res = ref.read(authControllerProvider.notifier).signUp(
            email: emailController.text,
            password: passwordController.text,
            context: context,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    const Text(
                      'Create New Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Pallete.pinkColor,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    const SizedBox(height: 45),
                    AuthField(
                      controller: emailController,
                      hintText: 'Your Email',
                      titleText: 'Email Address',
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      controller: passwordController,
                      hintText: 'Your Password',
                      titleText: 'Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    AuthField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Your Password',
                      titleText: 'Confirm Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundedSmallButton(
                        onTap: onSignUp,
                        label: 'Sign Up',
                      ),
                    ),
                    const SizedBox(height: 30),
                    RichText(
                        text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Pallete.backgroundColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: Pallete.pinkColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                LoginView.route(),
                              );
                            },
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
    );
  }
}
