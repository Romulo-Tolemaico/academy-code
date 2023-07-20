import 'package:flutter/material.dart';
import 'package:waterc/modelos/materias.model.dart';
import 'package:waterc/peticiones/materias.peticiones.dart';
import 'package:waterc/src/gestionarMateria.dart';
import 'package:waterc/src/home_page.dart';
import 'package:waterc/src/hora.dart';

// ignore: must_be_immutable
class Horario extends StatelessWidget {
  String dia;

  Horario(this.dia);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(65, 62, 64, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(
              'HORARIO',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 255,
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
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          dia = 'Lunes';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Lunes',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {
                          dia = 'Martes';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Martes',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {
                          dia = 'Miercoles';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Miercoles',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {
                          dia = 'Jueves';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Jueves',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          dia = 'Viernes';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Viernes',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {
                          dia = 'Sabado';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Sabado',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {
                          dia = 'Domingo';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage(dia)),
                          );
                        },
                        child: Text('Domingo',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 162, 120, 1),
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              dia.toUpperCase(),
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          devolverMaterias(context, listaMaterias(dia)),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => GestionarMateria(
                            'REGISTRAR MATERIA', "", "", true, dia)),
                  );
                },
                child: const Text('AGREGAR MATERIA'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(58, 162, 120, 1))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget devolverMaterias(
      BuildContext context, Future<List<Materia>> futureMateria) {
    return FutureBuilder(
      future: futureMateria,
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
                  child: Text('Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red)),
                ),
              );
            }
            return (snapshot.data != null)
                ? listaMateriaVista(snapshot.data, dia)
                : Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        'Sin datos',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
          default:
            return Text('Recarga la pantalla nuevamente',
                style: TextStyle(color: Colors.red));
        }
      },
    );
  }

  Widget listaMateriaVista(List<Materia> materias, String dia) {
    return materias.length == 0
        ? Container(
            width: 255,
            height: 300,
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
            child: Center(
              child: Text('SIN REGISTROS', style: TextStyle(color: Colors.red)),
            ))
        : Container(
            width: 255,
            height: 300,
            child: Scrollbar(
                child: ListView.builder(
              itemCount: materias.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text(
                          "${materias[index].nombre}",
                          style: TextStyle(
                              color: Hora().compararHora(
                                      "${materias[index].inicio}",
                                      "${materias[index].end}",
                                      dia)
                                  ? Color.fromRGBO(150, 0, 24, 1)
                                  : Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 18),
                        ),
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Container(
                              child: Text(
                                "Inicio: " + "${materias[index].inicio}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 223, 223, 223),
                                    fontSize: 12),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Final: " + "${materias[index].end}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 223, 223, 223),
                                    fontSize: 12),
                              ),
                            ),
                          ])),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: FloatingActionButton.small(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                GestionarMateria(
                                                    'MODIFICAR MATERIA',
                                                    materias[index].id,
                                                    materias[index].nombre,
                                                    false,
                                                    dia)),
                                      );
                                    },
                                    child: Icon(Icons.edit_calendar_outlined,
                                        color: Color.fromRGBO(92, 203, 95, 1)),
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromRGBO(102, 98, 100, 1))),
                            Container(
                                child: FloatingActionButton.small(
                                    onPressed: () {
                                      borrarMateria(materias[index].id)
                                          .then((value) {
                                        if (value.id != '') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    HomePage(dia)),
                                          );
                                        }
                                      });
                                    },
                                    child: Icon(Icons.remove_circle_outline,
                                        color: Color.fromRGBO(150, 0, 24, 1)),
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromRGBO(102, 98, 100, 1))),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
          );
  }
}
