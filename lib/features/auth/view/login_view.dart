import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/features/auth/view/signup_view.dart';
import 'package:beebeer_app2/features/auth/widgets/auth_field.dart';
import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider.notifier).state;
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
                      'Login Your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Pallete.pinkColor,
                        fontFamily: 'Raleway',
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Column(
                      children: [
                        AuthField(
                          controller: emailController,
                          hintText: 'Your Email',
                          titleText: 'Email Address',
                          isPassword: false,
                        ),
                        const SizedBox(height: 15),
                        AuthField(
                          controller: passwordController,
                          hintText: 'Your Password',
                          titleText: 'Password',
                          isPassword: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundedSmallButton(
                        onTap: onLogin,
                        label: 'Login',
                      ),
                    ),
                    const SizedBox(height: 30),
                    RichText(
                        text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Pallete.backgroundColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: Pallete.pinkColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                SignUpView.route(),
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
