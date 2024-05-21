import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseServices {
  static Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static CollectionReference<Map<String, dynamic>> productsCall =
      FirebaseFirestore.instance.collection('products');
  static CollectionReference<Map<String, dynamic>> categoryCall =
      FirebaseFirestore.instance.collection("category");

  static String generateID() {
    const name = "abdelmoneam";
    final nameChar = name.split("");
    final numbers = DateTime.now().microsecondsSinceEpoch.toString().split("");
    final id = [...nameChar, ...numbers]..shuffle();
    final docID = id.join();
    return docID;
  }
}
