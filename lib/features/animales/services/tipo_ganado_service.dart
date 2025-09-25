import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tipo_ganado.dart';

class TipoGanadoService {
  final String baseUrl = "https://proinnovate-api.pruebasgt.com/api";

  Future<List<TipoGanado>> fetchTiposGanado() async {
    final response = await http.get(Uri.parse('$baseUrl/tipos-ganado'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData["data"];
      return data.map((e) => TipoGanado.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar los tipos de ganado");
    }
  }
}
