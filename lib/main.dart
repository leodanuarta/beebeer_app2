import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/features/auth/view/signup_view.dart';
import 'package:beebeer_app2/features/home/view/home_view.dart';
import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            // console log user email after signup
            // print(user!.email);

            // if user already login this app can remember the user id
            // then the user dont login again, it can direct you to the homescreen view
            if (user != null) {
              return const HomeView();
            }
            return const SignUpView();
          },
          error: (error, st) => ErrorPager(error: error.toString()),
          loading: () => const LoadingPage()),
    );
  }
}
