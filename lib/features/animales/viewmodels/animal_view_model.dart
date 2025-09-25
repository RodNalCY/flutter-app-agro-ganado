import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../repositories/animal_repository.dart';

class AnimalViewModel extends ChangeNotifier {
  final AnimalRepository repository;
  bool _disposed = false;

  AnimalViewModel({required this.repository});

  List<Animal> _animals = [];
  List<Animal> _filteredAnimals = [];
  bool _isLoading = false;
  String? _error;

  List<Animal> get animals => _filteredAnimals;
  bool get isLoading => _isLoading;
  String? get error => _error;
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  Future<void> fetchAnimals() async {
    _isLoading = true;
    notifyListeners();

    try {
      _animals = await repository.getAnimals();
      _filteredAnimals = _animals; // al inicio, todos los animales
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void filterAnimals(String query) {
    if (query.isEmpty) {
      _filteredAnimals = _animals;
    } else {
      _filteredAnimals = _animals
          .where(
            (animal) =>
                animal.codigo.toLowerCase().contains(query.toLowerCase()) ||
                animal.descripcion.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }
}
