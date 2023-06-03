// // Page Number = 19
// final currentUserDetailsProvider = FutureProvider((ref) {
//   final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
//   final userDetails = ref.watch(userDetailsProvider(currentUserId));
//   return userDetails.value;
// });

// final userDetailsProvider = FutureProvider.family((ref, String uid) {
//   final authController = ref.watch(authControllerProvider.notifier);
//   return authController.getUserData(uid);
// });

// // Page Number paling akhir
// Future<UserModel> getUserData(String uid) async {
//   final document = await _userAPI.getUserData(uid);
//   final updatedUser = UserModel.fromMap(document.data);
//   return updatedUser;
// }
