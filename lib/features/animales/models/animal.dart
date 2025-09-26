class Animal {
  final int id;
  final String codigo;
  final String descripcion;
  final String fechaNacimiento;
  final String? imagenUrl;
  final TipoGanado tipoGanado;
  final Destino destino;
  final UltimoRegistroMedico? ultimoRegistroMedico;

  Animal({
    required this.id,
    required this.codigo,
    required this.descripcion,
    required this.fechaNacimiento,
    this.imagenUrl,
    required this.tipoGanado,
    required this.destino,
    this.ultimoRegistroMedico,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      codigo: json['codigo'],
      descripcion: json['descripcion'] ?? '',
      fechaNacimiento: json['fecha_nacimiento'] ?? '',
      imagenUrl: json['imagen_url'],
      tipoGanado: TipoGanado.fromJson(json['tipo_ganado']),
      destino: Destino.fromJson(json['destino']),
      ultimoRegistroMedico: json['ultimo_registro_medico'] != null
          ? UltimoRegistroMedico.fromJson(json['ultimo_registro_medico'])
          : null,
    );
  }
}

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

class UltimoRegistroMedico {
  final int id;
  final int animalId;
  final int enfermedadId;
  final String fechaRegistro;
  final String? fechaFin;
  final String observaciones;
  final String estado;
  final String costoTratamiento;
  final String veterinario;
  final Enfermedad? enfermedad; //  también puede ser null

  UltimoRegistroMedico({
    required this.id,
    required this.animalId,
    required this.enfermedadId,
    required this.fechaRegistro,
    this.fechaFin,
    required this.observaciones,
    required this.estado,
    required this.costoTratamiento,
    required this.veterinario,
    this.enfermedad,
  });

  factory UltimoRegistroMedico.fromJson(Map<String, dynamic> json) {
    return UltimoRegistroMedico(
      id: json['id'],
      animalId: json['animal_id'],
      enfermedadId: json['enfermedad_id'],
      fechaRegistro: json['fecha_registro'] ?? '',
      fechaFin: json['fecha_fin'],
      observaciones: json['observaciones'] ?? '',
      estado: json['estado'] ?? '',
      costoTratamiento: json['costo_tratamiento'] ?? '',
      veterinario: json['veterinario'] ?? '',
      enfermedad: json['enfermedad'] != null
          ? Enfermedad.fromJson(json['enfermedad'])
          : null,
    );
  }
}

class Enfermedad {
  final int id;
  final String nombre;
  final String descripcion;
  final int tipo_enfermedad_id;
  final String sintomas;
  final String tratamiento;
  final bool activo;
  final TipoEnfermedad? tipo_enfermedad;

  Enfermedad({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.tipo_enfermedad_id,
    required this.sintomas,
    required this.tratamiento,
    required this.activo,
    this.tipo_enfermedad,
  });

  factory Enfermedad.fromJson(Map<String, dynamic> json) {
    return Enfermedad(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      tipo_enfermedad_id: json['tipo_enfermedad_id'],
      sintomas: json['sintomas'],
      tratamiento: json['tratamiento'],
      activo: json['activo'],
      tipo_enfermedad: json['tipo_enfermedad'] != null
          ? TipoEnfermedad.fromJson(json['tipo_enfermedad'])
          : null,
    );
  }
}

class TipoEnfermedad {
  final int id;
  final String nombre;
  final String descripcion;

  TipoEnfermedad({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  factory TipoEnfermedad.fromJson(Map<String, dynamic> json) {
    return TipoEnfermedad(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }
}
