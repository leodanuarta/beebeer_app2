import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:beebeer_app2/models/notification_model.dart' as model;
import 'package:flutter_svg/svg.dart';
import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/core/enums/notification_type_enum.dart';


class NotificationTile extends StatelessWidget {
  final model.Notification notification;
  const NotificationTile({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: notification.notificationType == NotificationType.follow
          ? const Icon(
              Icons.person,
              color: Pallete.pinkColor,
            )
          : notification.notificationType == NotificationType.like
              ? SvgPicture.asset(
                  AssetsConstants.likeFilledIcon,
                  color: Pallete.redColor,
                  height: 20,
                )
              : notification.notificationType == NotificationType.retweet
                  ? SvgPicture.asset(
                      AssetsConstants.retweetIcon,
                      color: Pallete.pinkColor,
                      height: 20,
                    )
                  : null,
      title: Text(notification.text),
    );
  }
}