import 'dart:convert';

import 'package:waterc/modelos/materias.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Materia>> listaMaterias(String dia) async {
  final response =
      await http.get(Uri.parse('http://192.168.0.101:4000/api/materias/$dia'));
  return compute(decodeJson, response.body);
}

List<Materia> decodeJson(String responseBody) {
  final myJson = json.decode(responseBody);
  return myJson['materias']
      .map<Materia>((json) => Materia.fromJson(json))
      .toList();
}

mapMateria(Materia materia, bool mapId) {
  Map data;
  // Si vamos a guardar no enviamos el id en el objeto por que la genera la bd
  if (!mapId) {
    data = {
      'dia': '${materia.dia}',
      'nombre': '${materia.nombre}',
      'inicio': '${materia.inicio}',
      'final': '${materia.end}',
    };
    // Si vamos a modificar el objeto cliente con su id
  } else {
    data = {
      '_id': '${materia.id}',
      'dia': '${materia.dia}',
      'nombre': '${materia.nombre}',
      'inicio': '${materia.inicio}',
      'final': '${materia.end}',
    };
  }
  return data;
}

Future<Materia> addMateria(Materia materia) async {
  var url = Uri.parse('http://192.168.0.101:4000/api/materias/registro');
  var _body = json.encode(mapMateria(materia, false));
  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: _body);
  if (response.statusCode == 200) {
    return Materia.fromJson(jsonDecode(response.body)['materia']);
  } else {
    throw Exception('Error al intentar registrar la materia');
  }
}

Future<Materia> modificarMateria(Materia materia) async {
  var url = Uri.parse('http://192.168.0.101:4000/api/materias/modificar');
  var _body = json.encode(mapMateria(materia, true));
  var response = await http.put(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: _body);
  if (response.statusCode == 200) {
    return Materia.fromJson(jsonDecode(response.body)['materia']);
  } else {
    throw Exception('Error al intentar modificar la materia');
  }
}

Future<Materia> borrarMateria(String idMateria) async {
  final response = await http.delete(
    Uri.parse('http://192.168.0.101:4000/api/materias/eliminar/$idMateria'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
  );

  if (response.statusCode == 200) {
    return Materia.fromJson(jsonDecode(response.body)['materia']);
  } else {
    throw Exception('Error al intentar eliminar la materia');
  }
}
