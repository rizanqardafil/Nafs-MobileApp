import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/Users.dart';

class UserServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  static Future<void> saveUser(String id, email, name, usia, gender, profilePicture) async {
    await userCollection.doc(id).set({
      "userID": id,
      "email": email,
      "name": name,
      "usia": usia,
      "gender": gender,
      "profilePicture": profilePicture,
    });
  }

  static Future<void> updateUser(String id, email, name, usia, gender, profilePicture) async {
    await userCollection.doc(id).update({
      "name": name,
      "profilePicture": profilePicture,
    });
  }

  static Future<dynamic> getUser(String userID) async {
    QuerySnapshot snapshot = await userCollection.where("userID", isEqualTo: userID).get();

    if (snapshot.docs.isEmpty) {
      return null;
    }
    return Users(
      userID,
      snapshot.docs[0].get("email"),
      name: snapshot.docs[0].get('name'),
      usia: snapshot.docs[0].get('usia'),
      gender: snapshot.docs[0].get('gender'),
      profilePicture: snapshot.docs[0].get('profilePicture'),
    );
  }
}
