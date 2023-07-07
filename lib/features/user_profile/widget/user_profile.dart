// import 'dart:html';

import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/constants/assets_constants.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/features/tweet/widgets/tweet_card.dart';
import 'package:beebeer_app2/features/user_profile/controller/user_profile_controller.dart';
import 'package:beebeer_app2/features/user_profile/view/edit_profile_view.dart';
import 'package:beebeer_app2/features/user_profile/widget/follow_count.dart';
import 'package:beebeer_app2/models/user_model.dart';
import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class UserProfile extends ConsumerWidget {
  final UserModel user;
  const UserProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;

    return currentUser == null
        ? const Loader()
        : NestedScrollView(
            headerSliverBuilder: (context, innerBoxScroolled) {
              return [
                SliverAppBar(
                  expandedHeight: 150,
                  floating: true,
                  snap: true,
                  flexibleSpace: Stack(children: [
                    Positioned.fill(
                      child: user.bannerPic.isEmpty
                          ? Container(
                              color: Pallete.pinkColor,
                            )
                          : Image.network(
                              user.bannerPic,
                              fit: BoxFit.fitWidth,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePic),
                        radius: 45,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.all(20),
                      child: OutlinedButton(
                          onPressed: () {
                            if (currentUser.uid == user.uid) {
                              // edit profile
                              Navigator.push(context, EditProfileView.route());
                            } else {
                              ref
                                  .read(userProfileControllerProvider.notifier)
                                  .followUser(
                                      user: user,
                                      context: context,
                                      currentUser: currentUser);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Pallete.whiteColor,
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20)),
                          child: Text(
                              currentUser.uid == user.uid
                                  ? 'Edit Profile'
                                  : currentUser.following.contains(user.uid)
                                      ? 'Unfollow'
                                      : 'Follow',
                              style:
                                  const TextStyle(color: Pallete.whiteColor))),
                    ),
                  ]),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        if(user.isTwitterBlue)
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: SvgPicture.asset(AssetsConstants.verifiedIcon),
                        ),
                      ],
                    ),
                    Text(
                      '@${user.name}',
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Pallete.greyColor),
                    ),
                    Text(
                      user.bio,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Pallete.greyColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        FollowCount(
                            count: user.following.length, text: 'Following'),
                        const SizedBox(
                          width: 15,
                        ),
                        FollowCount(
                            count: user.followers.length, text: 'Followers'),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Divider(
                      color: Pallete.backgroundColor,
                    ),
                  ])),
                )
              ];
            },
            body: ref.watch(getUserTweetsProvider(user.uid)).when(
                  data: (tweets) {
                    // can make it realtime by copying code from beebeer_reply_view
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
                  loading: () => const Loader(),
                ),
          );
  }
}
