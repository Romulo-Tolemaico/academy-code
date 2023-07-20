class Tarea {
  var id;
  var titulo;
  var detalle;
  var estado;

  Tarea({this.id, this.titulo, this.detalle, this.estado});

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
        id: json['_id'],
        titulo: json['titulo'],
        detalle: json['detalle'],
        estado: json['estado']);
  }
}
