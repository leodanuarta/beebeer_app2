import 'package:beebeer_app2/common/common.dart';
import 'package:beebeer_app2/features/explore/controller/explore_controller.dart';
import 'package:beebeer_app2/features/explore/widgets/search_tile.dart';
import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  final searchController = TextEditingController();
  bool isShowUser = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Pallete.whiteColor,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          child: SizedBox(
            height: 50,
            child: TextField(
              controller: searchController,
              onSubmitted: (value) {
                setState(() {
                  isShowUser = true;
                });
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10).copyWith(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 20,
                  ),
                  // untuk pengaturan warna di searchbar
                  fillColor: Pallete.searchBarColor,
                  filled: true,
                  enabledBorder: appBarTextFieldBorder,
                  focusedBorder: appBarTextFieldBorder,
                  hintText: 'Search Beebeer'),
            ),
          ),
        ),
      ),
      body: isShowUser
          ? ref.watch(searchUserProvider(searchController.text)).when(
                data: (users) {
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = users[index];
                      return SearchTile(userModel: user);
                    },
                  );
                },
                error: (error, st) => ErrorText(
                  error: error.toString(),
                ),
                loading: () => const Loader(),
              )
          : const SizedBox(),
    );
  }
}
