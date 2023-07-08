import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/constants/constants.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/features/notifications/controller/notification_controller.dart';
import 'package:beebeer_app2/features/notifications/widget/notification_tile.dart';
import 'package:beebeer_app2/models/notification_model.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white, // Mengatur warna teks menjadi hitam
          ),
        ),
      ),
      body: currentUser == null
          ? const Loader()
          : ref.watch(getNotificationsProvider(currentUser.uid)).when(
                data: (notifications) {
                  return ref.watch(getLatestNotificationProvider).when(
                        data: (data) {
                          if (data.events.contains(
                            'databases.*.collections.${AppwriteConstants.notificationsCollection}.documents.*.create',
                          )) {
                            final latestNotif =
                                model.Notification.fromMap(data.payload);
                            if (latestNotif.uid == currentUser.uid) {
                              notifications.insert(0, latestNotif);
                            }
                          }

                          return ListView.builder(
                            itemCount: notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              final notification = notifications[index];
                              return NotificationTile(
                                notification: notification,
                              );
                            },
                          );
                        },
                        error: (error, StackTrace) => ErrorText(
                          error: error.toString(),
                        ),
                        loading: () {
                          return ListView.builder(
                            itemCount: notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              final notification = notifications[index];
                              return NotificationTile(
                                notification: notification,
                              );
                            },
                          );
                        },
                      );
                },
                error: (error, stackTrace) => ErrorText(
                  error: error.toString(),
                ),
                loading: () => const Loader(),
              ),
    );
  }
}
