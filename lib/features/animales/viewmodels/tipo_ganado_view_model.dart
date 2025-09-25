import 'package:flutter/material.dart';
import '../models/tipo_ganado.dart';
import '../services/tipo_ganado_service.dart';

class TipoGanadoViewModel extends ChangeNotifier {
  final TipoGanadoService _service = TipoGanadoService();

  List<TipoGanado> _tipos = [];
  bool _isLoading = false;

  List<TipoGanado> get tipos => _tipos;
  bool get isLoading => _isLoading;

  Future<void> fetchTipos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tipos = await _service.fetchTiposGanado();
    } catch (e) {
      _tipos = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
