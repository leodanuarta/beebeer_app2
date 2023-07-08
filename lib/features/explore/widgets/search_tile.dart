import 'package:beebeer_app2/features/user_profile/view/user_profile_view.dart';
import 'package:beebeer_app2/models/user_model.dart';
import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final UserModel userModel;
  const SearchTile({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            UserProfileView.route(userModel),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userModel.profilePic),
          radius: 30,
        ),
        title: Text(
          userModel.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@${userModel.name}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              userModel.bio,
              style: const TextStyle(
                color: Pallete.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
