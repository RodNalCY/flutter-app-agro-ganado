import 'package:flutter/material.dart';
import '../models/destino.dart';
import '../repositories/destino_repository.dart';

class DestinoViewModel extends ChangeNotifier {
  final DestinoRepository repository;

  DestinoViewModel({required this.repository});
  List<Destino> _destinos = [];
  bool _isLoading = false;
  String? _error;

  List<Destino> get destinos => _destinos;
  bool get isLoading => _isLoading;
  String? get error => _error;


  Future<void> fetchDestinos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _destinos = await repository.getDestinos();
      _error = null;
    } catch (e) {
      _destinos = [];
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
