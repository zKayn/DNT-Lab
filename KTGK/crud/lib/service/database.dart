import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future AddSp(Map<String, dynamic> spInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Sanpham")
        .doc(id)
        .set(spInfoMap);
  }
}
