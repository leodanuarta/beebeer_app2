import 'package:beebeer_app2/common/error_page.dart';
import 'package:beebeer_app2/common/loading_page.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/features/tweet/widgets/hastag_text.dart';
import 'package:beebeer_app2/models/tweet_model.dart';
import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class TweetCard extends ConsumerWidget {
  final Tweet tweet;
  const TweetCard({
    super.key,
    required this.tweet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).when(
          data: (user) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePic),
                        radius: 35,
                      ),
                    ),
                    Column(
                      children: [
                        //retweeted
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text(
                                user.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            Text(
                              '@${user.name} · ${timeago.format(
                                tweet.tweetedAt,
                                locale: 'en_short',
                              )}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Pallete.greyColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                        //replied to
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
