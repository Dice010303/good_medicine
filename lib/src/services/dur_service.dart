import 'dart:convert';
import 'package:http/http.dart' as http;

class DurService {
  final String _baseUrl = "apis.data.go.kr";
  final String _serviceKey = "YOUR_DECODED_SERVICE_KEY";

  Future<String?> checkContraindication(String codeA, String codeB) async {
    if (codeA == codeB) return null;

    final queryParams = {
      'serviceKey': _serviceKey,
      'type': 'json',
      'mixtureIncsCode': codeA,
    };

    try {
      final uri = Uri.https(_baseUrl, '/1471000/DURPrscrSrv/getUsjntTabooInfoList', queryParams);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        final items = data['body']?['items'];
        if (items != null && items is List) {
          for (var item in items) {
            if (item['mixtureIncsCode'] == codeB || item['incsCode'] == codeB) {
              return item['prohbtContent'] ?? "병용 금기 약물입니다.";
            }
          }
        }
      }
    } catch (e) { print(e); }
    return null;
  }
}