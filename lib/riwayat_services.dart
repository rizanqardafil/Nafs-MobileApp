import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nafs/screening/result.dart';

import 'models/Riwayats.dart';

class RiwayatServices {
  static CollectionReference riwayatCollection = FirebaseFirestore.instance.collection("riwayats");

  static Future<void> saveRiwayat(String id, Result result) async {
    await riwayatCollection.doc().set({
      "userID": id,
      "stress": result.categoryStress,
      "cemas": result.categoryCemas,
      "depresi": result.categoryDepresi,
      // "insomnia": result.categoryInsomnia,
      "kategoristress": result.kategoriStress,
      "kategoridepresi": result.kategoriDepresi,
      "kategoricemas": result.kategoriCemas,
      // "kategoriinsomnia": result.kategoriInsomnia,
      "time": DateTime.now().millisecondsSinceEpoch,
    });
  }

  static Future<List<Riwayat>> getRiwayat(String userID) async {
    QuerySnapshot snapshot = await riwayatCollection.where("userID", isEqualTo: userID).get();

    List<Riwayat> riwayats = [];
    for (var document in snapshot.docs) {
      riwayats.add(Riwayat(
        document.get("cemas"),
        document.get("depresi"),
        // document.get("insomnia"),
        document.get("stress"),
        document.get("kategoricemas"),
        document.get("kategoridepresi"),
        // document.get("kategoriinsomnia"),
        document.get("kategoristress"),
        DateTime.fromMillisecondsSinceEpoch(document.get("time")),
      ));
    }

    return riwayats;
  }
}
