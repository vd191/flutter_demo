import 'dart:convert';
import 'package:flutter_demo/src/features/sample_feature/sample_item.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://trading-bot-vdtt-eu-70f1d82ef19d.herokuapp.com/api/";

  Future<List<SampleItem>> getSignalList() async {
    final response = await http.get(Uri.parse('$baseUrl/get-signals'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => SampleItem(item['side'], item['entryPrice']))
          .toList();
    } else {
      throw Exception("Failed to load items");
    }
  }
}
