import 'dart:io';
import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/core/utils.dart';
import 'package:beebeer_app2/features/auth/controller/auth_controller.dart';
import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const EditProfileView(),
      );
  const EditProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  File? bannerFile;
  File? profileFile;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    bioController.dispose();
  }

  void selectBannerImage() async {
    final banner = await pickImage();
    if (banner != null) {
      setState(() {
        bannerFile = banner;
      });
    }
  }

  void selectProfileImage() async {
    final profileImage = await pickImage();
    if (profileImage != null) {
      setState(() {
        profileFile = profileImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserDetailsProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Pallete.backgroundColor),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Pallete.pinkColor),
            ),
          ),
        ],
      ),
      body: user == null
          ? const Loader()
          : Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: selectBannerImage,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: bannerFile != null
                              ? Image.file(
                                  bannerFile!,
                                  fit: BoxFit.fitWidth,
                                )
                              : user.bannerPic.isEmpty
                                  ? Container(
                                      color: Pallete.pinkColor,
                                    )
                                  : Image.network(
                                      user.bannerPic,
                                      fit: BoxFit.fitWidth,
                                    ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: GestureDetector(
                          onTap: selectProfileImage,
                          child: profileFile!=null? CircleAvatar(
                            backgroundImage: FileImage(profileFile!),
                            radius: 40,
                          ) : CircleAvatar(
                            backgroundImage: NetworkImage(user.profilePic),
                            radius: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: 'Name', contentPadding: EdgeInsets.all(18)),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(
                      hintText: 'Bio', contentPadding: EdgeInsets.all(18)),
                  maxLines: 4,
                ),
              ],
            ),
    );
  }
}
