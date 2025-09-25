import '../models/animal.dart';
import '../services/animal_api_service.dart';

class AnimalRepository {
  final AnimalApiService apiService;

  AnimalRepository({required this.apiService});

  Future<List<Animal>> getAnimals() async {
    return await apiService.fetchAnimals();
  }
}
