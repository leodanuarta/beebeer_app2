import 'package:beebeer_app2/common/error_page.dart';
import 'package:beebeer_app2/common/loading_page.dart';
import 'package:beebeer_app2/constants/appwrite_constants.dart';
import 'package:beebeer_app2/features/tweet/controller/tweet_controller.dart';
import 'package:beebeer_app2/features/tweet/widgets/tweet_card.dart';
import 'package:beebeer_app2/models/tweet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TweetList extends ConsumerWidget {
  const TweetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetsProvider).when(
          data: (tweets) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ref.watch(getLatestTweetProvider).when(
                    data: (data) {
                      if (data.events.contains(
                        'databases.*.collections.${AppwriteConstants.tweetsCollection}.documents.*.create',
                      )) {
                        tweets.insert(0, Tweet.fromMap(data.payload));
                      } else if (data.events.contains(
                        'databases.*.collections.${AppwriteConstants.tweetsCollection}.documents.*.update',
                      )) {
                        //get id of tweet

                        final startingPoint =
                            data.events[0].lastIndexOf('documents.');
                        final endPoint = data.events[0].lastIndexOf('.update');
                        final tweedId = data.events[0]
                            .substring(startingPoint + 10, endPoint);

                        var tweet = tweets
                            .where((element) => element.id == tweedId)
                            .first;

                        final tweetIndex = tweets.indexOf(tweet);
                        tweets.removeWhere((element) => element.id == tweedId);

                        tweet = Tweet.fromMap(data.payload);
                        tweets.insert(tweetIndex, tweet);
                      }

                      return ListView.builder(
                        itemCount: tweets.length,
                        itemBuilder: (BuildContext context, int index) {
                          final tweet = tweets[index];
                          return TweetCard(tweet: tweet);
                        },
                      );
                    },
                    error: (error, st) => ErrorText(
                      error: error.toString(),
                    ),
                    loading: () {
                      return ListView.builder(
                        itemCount: tweets.length,
                        itemBuilder: (BuildContext context, int index) {
                          final tweet = tweets[index];
                          return TweetCard(tweet: tweet);
                        },
                      );
                    },
                  ),
            );
          },
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
