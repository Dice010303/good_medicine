import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pill_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<PillModel>> getMyPills(String userId) {
    return _db.collection('users').doc(userId).collection('my_pills')
        .orderBy('createdAt', descending: true)
        .snapshots().map((snapshot) => snapshot.docs.map((doc) =>
        PillModel.fromJson({...doc.data(), 'id': doc.id})).toList());
  }

  Future<void> addPill(String userId, PillModel pill) async {
    await _db.collection('users').doc(userId).collection('my_pills').add({
      ...pill.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deletePill(String userId, String pillId) async {
    await _db.collection('users').doc(userId).collection('my_pills').doc(pillId).delete();
  }
}