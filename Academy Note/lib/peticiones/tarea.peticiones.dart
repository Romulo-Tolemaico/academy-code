import 'dart:convert';

import 'package:waterc/modelos/tarea.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Tarea>> listaTareas() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.101:4002/api/tareas'));
  return compute(decodeJson, response.body);
}

List<Tarea> decodeJson(String responseBody) {
  final myJson = json.decode(responseBody);
  return myJson['tareas'].map<Tarea>((json) => Tarea.fromJson(json)).toList();
}

mapTarea(Tarea tarea, bool mapId) {
  Map data;
  // Si vamos a guardar no enviamos el id en el objeto por que la genera la bd
  if (!mapId) {
    data = {
      'titulo': '${tarea.titulo}',
      'detalle': '${tarea.detalle}',
      'estado': '${tarea.estado}',
    };
    // Si vamos a modificar el objeto cliente con su id
  } else {
    data = {
      '_id': '${tarea.id}',
      'titulo': '${tarea.titulo}',
      'detalle': '${tarea.detalle}',
      'estado': '${tarea.estado}',
    };
  }
  return data;
}

Future<Tarea> addTarea(Tarea tarea) async {
  var url = Uri.parse('http://192.168.0.101:4002/api/tareas/registro');
  var _body = json.encode(mapTarea(tarea, false));
  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: _body);
  if (response.statusCode == 200) {
    return Tarea.fromJson(jsonDecode(response.body)['tarea']);
  } else {
    throw Exception('Error al intentar registrar la tarea');
  }
}

Future<Tarea> modificarTarea(Tarea tarea) async {
  var url = Uri.parse('http://192.168.0.101:4002/api/tareas/modificar');
  var _body = json.encode(mapTarea(tarea, true));
  var response = await http.put(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: _body);
  if (response.statusCode == 200) {
    return Tarea.fromJson(jsonDecode(response.body)['tarea']);
  } else {
    throw Exception('Error al intentar modificar la tarea');
  }
}

Future<Tarea> borrarTarea(String idTarea) async {
  final response = await http.delete(
    Uri.parse('http://192.168.0.101:4002/api/tareas/eliminar/$idTarea'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
  );

  if (response.statusCode == 200) {
    return Tarea.fromJson(jsonDecode(response.body)['tarea']);
  } else {
    throw Exception('Error al intentar eliminar la tarea');
  }
}
