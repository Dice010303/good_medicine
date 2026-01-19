import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pill_model.dart';

class ApiService {
  final String _baseUrl = "apis.data.go.kr";
  final String _serviceKey = "YOUR_DECODED_SERVICE_KEY"; // 여기에 실제 키를 넣으세요.

  Future<PillModel?> fetchPillInfo(String itemName) async {
    final queryParameters = {
      'serviceKey': _serviceKey,
      'itemName': itemName,
      'type': 'json',
    };

    try {
      final uri = Uri.https(_baseUrl, '/1471000/DrbEasyDrugInfoService/getDrbEasyList', queryParameters);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        final items = data['body']?['items'];

        if (items != null && items is List && items.isNotEmpty) {
          final item = items[0];
          return PillModel(
            id: item['itemSeq']?.toString() ?? '',
            name: item['itemName'] ?? itemName,
            ingredient: "성분 확인 중",
            ingredientCode: item['itemSeq']?.toString() ?? '',
            effect: _cleanHtml(item['efcyQesitm'] ?? "정보 없음"),
            sideEffects: [_cleanHtml(item['seQesitm'] ?? ""), _cleanHtml(item['atpnQesitm'] ?? "")],
          );
        }
      }
    } catch (e) {
      print("API 에러: $e");
    }
    return null;
  }

  String _cleanHtml(String text) => text.replaceAll(RegExp(r"<[^>]*>"), "").trim();
}