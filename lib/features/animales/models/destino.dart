class Destino {
  final int id;
  final String nombre;
  final String descripcion;
  final String unidadMedida;

  Destino({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.unidadMedida,
  });

  factory Destino.fromJson(Map<String, dynamic> json) {
    return Destino(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      unidadMedida: json['unidad_medida'],
    );
  }
}
