import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text(
              'I Wanna Be Yours',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Raleway',
                // fontWeight: FontWeight.bold,
                color: Pallete.pinkColor,
              ),
            ),
            const Text(
              'ini home screen ygy',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Raleway',
                // fontWeight: FontWeight.bold,
                color: Pallete.whiteColor,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
