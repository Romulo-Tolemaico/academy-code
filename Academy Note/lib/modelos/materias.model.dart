class Materia {
  var id;
  var dia;
  var nombre;
  var inicio;
  var end;

  Materia({this.id, this.dia, this.nombre, this.inicio, this.end});

  factory Materia.fromJson(Map<String, dynamic> json) {
    return Materia(
        id: json['_id'],
        dia: json['dia'],
        nombre: json['nombre'],
        inicio: json['inicio'],
        end: json['final']);
  }
}
