import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final appBar = UIConstants.appBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Pallete.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.homeFilledIcon,
              // color: Pallete.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.searchIcon,
              // color: Pallete.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.notifFilledIcon,
              // color: Pallete.whiteColor,
            ),
          ),
        ],
      ), //CupertinoTabBar
    );
  }
}
