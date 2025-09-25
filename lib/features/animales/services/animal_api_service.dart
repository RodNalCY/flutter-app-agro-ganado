import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/animal.dart';

class AnimalApiService {
  final String baseUrl = "https://proinnovate-api.pruebasgt.com/api";

  Future<List<Animal>> fetchAnimals() async {
    final response = await http.get(Uri.parse("$baseUrl/animales"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> animalList = data['data'];

      return animalList.map((json) => Animal.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar animales");
    }
  }
}
