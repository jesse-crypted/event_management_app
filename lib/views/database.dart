import 'package:appwrite/appwrite.dart';
import 'package:event_management_app/auth.dart';
import 'package:event_management_app/saved_data.dart';

String databaseId = "654617ab6c26333317bc";

final Databases databases = Databases(client);

// save the user data to appwrite database
Future<void> saveUserData(String name, String email, String userId) async {
  return await databases
      .createDocument(
          databaseId: databaseId,
          collectionId: "6546184c3bb21d2591c7",
          documentId: ID.unique(),
          data: {
            "name": name,
            "email": email,
            "userId": userId,
          })
      .then((value) => print("Document Created"))
      .catchError((e) => print(e));
}

// Get user data from the database

Future getUserData() async {
  final id = SavedData.getUserId();
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: "6546184c3bb21d2591c7",
        queries: [Query.equal("userId", id)]);

    SavedData.saveUserName(data.documents[0].data['name']);
    SavedData.saveUserEmail(data.documents[0].data['email']);
    print(data);
  } catch (e) {
    print(e);
  }
}
