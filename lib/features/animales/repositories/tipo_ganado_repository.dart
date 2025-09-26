import '../models/tipo_ganado.dart';
import '../services/tipo_ganado_api_service.dart';

class TipoGanadoRepository {
  final TipoGanadoApiService apiService;

  TipoGanadoRepository({required this.apiService});

  Future<List<TipoGanado>> getTipoGanados() async {
    return await apiService.fetchTiposGanado();
  }
}
