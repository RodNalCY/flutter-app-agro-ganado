import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/destino.dart';

class DestinoApiService {
  final String baseUrl = 'https://proinnovate-api.pruebasgt.com/api';

  Future<List<Destino>> fetchDestinos() async {
    final response = await http.get(Uri.parse('$baseUrl/destinos'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData["data"];
      return data.map((e) => Destino.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load destinos');
    }
  }
}
