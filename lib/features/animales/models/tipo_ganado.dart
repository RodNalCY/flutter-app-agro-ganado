class TipoGanado {
  final int id;
  final String nombre;
  final String descripcion;

  TipoGanado({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  factory TipoGanado.fromJson(Map<String, dynamic> json) {
    return TipoGanado(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }
}
