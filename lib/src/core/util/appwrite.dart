import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('66c84d790003c999c87e')
    .setSelfSigned(status: true);

// For self signed certificates, only use for development

const String db = "66c84da70030a53afb2c";
const String userCollection = "66c84db00020c62c9102";

Account account = Account(client);

final Databases databases = Databases(client);

// save phone number to database
Future<bool> savePhoneToDb(
    {required String phoneNumber, required String userId}) async {
  try {
    final response = await databases.createDocument(
        databaseId: db,
        collectionId: userCollection,
        documentId: userId,
        data: {"phone_number": phoneNumber, "userId": userId});

    print(response);
    return true;
  } on AppwriteException catch (e) {
    print("Cannot save to user database :$e");
    return false;
  }
}

// check if phone number exists in database
Future<String> checkPhoneNumber({required String phoneNumber}) async {
  try {
    final DocumentList matchUser = await databases.listDocuments(
        databaseId: db,
        collectionId: userCollection,
        queries: [Query.equal("phone_number", phoneNumber)]);

    if (matchUser.total > 0) {
      final Document user = matchUser.documents[0];

      if (user.data["phone_number"] != null ||
          user.data["phone_number"] != "") {
        return user.data["userId"];
      } else {
        print("no user exist on db");
        return "user_not_exist";
      }
    } else {
      print("no user exist on db");
      return "user_not_exist";
    }
  } on AppwriteException catch (e) {
    print("error on reading database $e");
    return "user_not_exist";
  }
}

// create a phone session, send otp to phone number
Future<String> createPhoneSession({required String phone}) async {
  try {
    final userId = await checkPhoneNumber(phoneNumber: phone);
    if (userId == "user_not_exist") {
      print('vo ne11111111111111111111111111');
      // creating a new account
      final Token data =
          await account.createPhoneToken(userId: ID.unique(), phone: phone);

      // save the new user to user collection
      savePhoneToDb(phoneNumber: phone, userId: data.userId);
      return data.userId;
    }

    // if user is an existing user
    else {
      // create phone token for existing user
      final Token data =
          await account.createPhoneToken(userId: userId, phone: phone);
      return data.userId;
    }
  } catch (e) {
    print("error on create phone session :$e");
    return "login_error";
  }
}

// login with otp
Future<bool> loginWithOtp({required String otp, required String userId}) async {
  try {
    final Session session =
        await account.updatePhoneSession(userId: userId, secret: otp);
    print(session.userId);
    return true;
  } catch (e) {
    print("error on login with otp :$e");
    return false;
  }
}

// to check whether the session exist or not
Future<bool> checkSessions() async {
  try {
    final Session session = await account.getSession(sessionId: "current");
    print("session exist ${session.$id}");
    return true;
  } catch (e) {
    print("session does not exist please login");
    return false;
  }
}

// to logout the user and delete session
Future logoutUser() async {
  await account.deleteSession(sessionId: "current");
}
