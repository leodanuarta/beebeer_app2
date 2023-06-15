// import 'package:beebeer_app2/animation/FadeAnimation.dart';
import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/features/auth/view/login_view.dart';
import 'package:beebeer_app2/features/auth/view/signup_view.dart';
import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:simple_animations/simple_animations.dart';
// import '../../../animation/FadeAnimation.dart';

class WelcomeView extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const WelcomeView());
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final appbar = UIConstants.appBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(30, 30, 30, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 50,
                  color: Pallete.pinkColor,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 15),
              SvgPicture.asset(
                AssetsConstants.beebeerIcon,
                height: 200,
              ),
              // const SizedBox(height: 30),
              const Text(
                "See what's happening in the world right now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Pallete.greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 40),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        LoginView.route(),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Pallete.greyColor),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20,
                          color: Pallete.pinkColor,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(1),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          SignUpView.route(),
                        );
                      },
                      color: Pallete.pinkColor,
                      shape: RoundedRectangleBorder(
                          // side:
                          //     const BorderSide(color: Pallete.backgroundColor),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            color: Pallete.whiteColor,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
