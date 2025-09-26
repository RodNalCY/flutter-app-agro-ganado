import 'package:proinnovate_flutter_app/features/animales/models/animal.dart';
import 'package:proinnovate_flutter_app/features/animales/services/destino_api_service.dart';

class DestinoRepository {
  final DestinoApiService apiService;

  DestinoRepository({required this.apiService});

  Future<List<Destino>> getDestinos() async {
    return await apiService.fetchDestinos();
  }
}
