import 'package:beebeer_app2/common/error_page.dart';
import 'package:beebeer_app2/common/loading_page.dart';
import 'package:beebeer_app2/features/tweet/controller/tweet_controller.dart';
import 'package:beebeer_app2/features/tweet/widgets/tweet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TweetList extends ConsumerWidget {
  const TweetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetsProvider).when(
          data: (tweets) {
            return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (BuildContext context, int index) {
                final tweet = tweets[index];
                return TweetCard(tweet: tweet);
              },
            );
          },
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
