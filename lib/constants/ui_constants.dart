import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/features/explore/view/explore_view.dart';
import 'package:beebeer_app2/features/notifications/view/notification_view.dart';
import 'package:beebeer_app2/features/tweet/widgets/tweet_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.menu,
      //     color: Pallete.pinkColor, // Replace Colors.red with the desired color
      //   ),
      //   onPressed: () {
      //     // Scaffold.of(context).openDrawer(); // Open the drawer
      //   },
      // ),
      title: SvgPicture.asset(
        AssetsConstants.beebeerLogoL,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    TweetList(),
    ExploreView(),
    NotificationView(),
  ];
}
