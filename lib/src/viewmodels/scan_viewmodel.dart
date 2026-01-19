import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../models/pill_model.dart';
import '../services/api_service.dart';
import '../services/dur_service.dart';

class ScanViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final DurService _durService = DurService();
  final TextRecognizer _recognizer = TextRecognizer(script: TextRecognitionScript.korean);

  List<PillModel> scannedPills = [];
  bool isLoading = false;
  String? warningMessage;

  Future<void> processImage(String path) async {
    isLoading = true;
    scannedPills = [];
    notifyListeners();

    try {
      final inputImage = InputImage.fromFilePath(path);
      final recognizedText = await _recognizer.processImage(inputImage);

      RegExp regExp = RegExp(r"([가-힣]+(정|캡슐|액))");
      final matches = regExp.allMatches(recognizedText.text);

      for (var match in matches) {
        final pill = await _apiService.fetchPillInfo(match.group(0)!);
        if (pill != null) scannedPills.add(pill);
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkWarning(PillModel scanned, List<PillModel> myPills) async {
    for (var myPill in myPills) {
      final result = await _durService.checkContraindication(scanned.ingredientCode, myPill.ingredientCode);
      if (result != null) {
        warningMessage = result;
        notifyListeners();
        return true;
      }
    }
    return false;
  }
}