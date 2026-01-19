import 'package:flutter/material.dart';
import '../models/pill_model.dart';
import '../services/firestore_service.dart';

class PillViewModel extends ChangeNotifier {
  final FirestoreService _service = FirestoreService();
  List<PillModel> _myPills = [];
  List<PillModel> get myPills => _myPills;
  bool isLoading = false;

  void fetchMyPills(String userId) {
    isLoading = true;
    _service.getMyPills(userId).listen((pills) {
      _myPills = pills;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> removePill(String userId, String pillId) async {
    await _service.deletePill(userId, pillId);
  }

  Future<void> savePill(String userId, PillModel pill) async {
    await _service.addPill(userId, pill);
  }
}