import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:folks/utils/constants.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  DatabaseService() {}

  Future<DocumentSnapshot> getUser(String _uid) {
    return _db.collection(USER_COLLECTION).doc(_uid).get();
  }

  Future<void> updateUser(String _uid, Map<String, dynamic> user) async {
    try {
      await _db.collection(USER_COLLECTION).doc(_uid).update(user);
    } catch (e) {
      print(e);
    }
  }
}
