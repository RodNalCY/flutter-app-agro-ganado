class Animal {
  final int id;
  final String codigo;
  final String descripcion;
  final String fechaNacimiento;
  final String? imagenUrl;

  Animal({
    required this.id,
    required this.codigo,
    required this.descripcion,
    required this.fechaNacimiento,
    this.imagenUrl,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      codigo: json['codigo'],
      descripcion: json['descripcion'] ?? '',
      fechaNacimiento: json['fecha_nacimiento'] ?? '',
      imagenUrl: json['imagen_url'],
    );
  }
}
