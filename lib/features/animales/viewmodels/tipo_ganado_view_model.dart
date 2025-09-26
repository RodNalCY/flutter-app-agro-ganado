import 'package:flutter/material.dart';
import '../repositories/tipo_ganado_repository.dart';
import '../models/tipo_ganado.dart';

class TipoGanadoViewModel extends ChangeNotifier {
  final TipoGanadoRepository repository;

  TipoGanadoViewModel({required this.repository});
  List<TipoGanado> _tipos = [];
  bool _isLoading = false;
  String? _error;

  List<TipoGanado> get tipos => _tipos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTipos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tipos = await repository.getTipoGanados();
      _error = null;
    } catch (e) {
      _tipos = [];
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
