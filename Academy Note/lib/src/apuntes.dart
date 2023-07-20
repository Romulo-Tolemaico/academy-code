import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:waterc/modelos/tarea.model.dart';
import 'package:waterc/peticiones/tarea.peticiones.dart';
import 'package:waterc/src/home_page.dart';
import 'package:waterc/src/registrarTarea.dart';

class Apuntes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaTareasState();
  }
}

class ListaTareasState extends State<Apuntes> {
  @override
  void initState() {
    super.initState();
  }

  //ListaTareasState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Align(
                child: Text(
              'LISTA DE TAREAS',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          devolverTareas(context, listaTareas()),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => GestionarTarea(
                            'REGISTRAR TAREA', '', '', '', false, true)),
                  );
                },
                child: const Text('AGREGAR TAREA'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(58, 162, 120, 1),
                )),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(65, 62, 64, 1),
    );
  }

  Widget devolverTareas(BuildContext context, Future<List<Tarea>> futureTarea) {
    return FutureBuilder(
      future: futureTarea,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            return (snapshot.data != null)
                ? listaTareaVista(snapshot.data)
                : Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text('Sin datos'),
                    ),
                  );
          default:
            return Text('Recarga la pantalla nuevamente');
        }
      },
    );
  }

  Widget listaTareaVista(List<Tarea> tareas) {
    return Container(
      width: 255,
      height: 400,
      child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Scrollbar(
              child: ListView.builder(
                  itemCount: tareas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            offset: new Offset(0.0, 10.0),
                            blurRadius: 10.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(102, 98, 100, 1),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("${tareas[index].titulo}",
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    )),
                              ),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("${tareas[index].detalle}",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 223, 223, 223),
                                        fontSize: 12)),
                              ),
                            ),
                            Container(
                                child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors.blue),
                                        child: Checkbox(
                                          value: tareas[index].estado,
                                          checkColor: Colors.blue,
                                          activeColor:
                                              Color.fromRGBO(102, 98, 100, 1),
                                          onChanged: (value) {
                                            Tarea t = new Tarea(
                                                id: "${tareas[index].id}",
                                                titulo:
                                                    "${tareas[index].titulo}",
                                                detalle:
                                                    "${tareas[index].detalle}",
                                                estado: !tareas[index].estado);
                                            modificarTarea(t).then((value) {
                                              if (value.id != '') {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (builder) =>
                                                          HomePage("Lunes")),
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  FloatingActionButton.small(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                GestionarTarea(
                                                  'MODIFICAR TAREA',
                                                  "${tareas[index].id}",
                                                  "${tareas[index].titulo}",
                                                  "${tareas[index].detalle}",
                                                  tareas[index].estado,
                                                  false,
                                                )),
                                      );
                                    },
                                    child: Icon(
                                      Icons.edit_document,
                                      color: Color.fromRGBO(92, 203, 95, 1),
                                    ),
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromRGBO(102, 98, 100, 1),
                                  ),
                                  FloatingActionButton.small(
                                    onPressed: () {
                                      borrarTarea(tareas[index].id)
                                          .then((value) {
                                        if (value.id != '') {
                                          setState(() {});
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    HomePage("Lunes")),
                                          );
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Color.fromRGBO(150, 0, 24, 1),
                                    ),
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromRGBO(102, 98, 100, 1),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  }))),
    );
  }
}
