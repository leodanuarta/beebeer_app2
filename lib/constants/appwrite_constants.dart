class AppwriteConstants {
  static const String databaseId = '646f7c9bdca68bac75a0';
  static const String projectId = '646cda321effe0caaa7b';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String usersCollection = '6473311fad2aed84fbab';
  static const String tweetsCollection = '64736d17cebbfc0253bb';
  static const String notificationsCollection = '64a68c01ba89764cb177';

  static const String imagesBucket = '64736ec502d588725d92';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
