import 'package:flutter/material.dart';
import 'package:waterc/modelos/tarea.model.dart';
import 'package:waterc/peticiones/tarea.peticiones.dart';
import 'package:waterc/src/home_page.dart';

// ignore: must_be_immutable
class GestionarTarea extends StatelessWidget {
  String tituloGeneral;
  String titulo;
  String detalle;
  bool estado;
  bool turno;
  String id;

  final formkey = GlobalKey<FormState>();
  GestionarTarea(this.tituloGeneral, this.id, this.titulo, this.detalle,
      this.estado, this.turno);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(65, 62, 64, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'ACADEMY NOTE',
              style: TextStyle(
                  color: Color.fromRGBO(58, 162, 120, 1), fontSize: 20),
            ),
          ),
        ),
        body: Form(
            key: formkey,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Titulo general
                    Container(
                      child: Align(
                          child: Text(
                        tituloGeneral,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                    //Imagen
                    Container(
                      child: Image.asset(
                        'assets/registrando.png',
                        scale: 5,
                        color: const Color.fromRGBO(58, 162, 120, 1),
                      ),
                    ),
                    //Titulo
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'TITULO',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(58, 162, 120, 1)),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            initialValue: titulo,
                            cursorColor: Color.fromRGBO(255, 255, 255, 1),
                            style: TextStyle(
                                color: Color.fromARGB(255, 223, 223, 223)),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            onSaved: (value) {
                              titulo = value.toString();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Llene este campo';
                              }
                              return null;
                            },
                          ),
                        ),
                      ]),
                    ),
                    //Detalle
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'DETALLE',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(58, 162, 120, 1)),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              initialValue: detalle,
                              cursorColor: Color.fromRGBO(255, 255, 255, 1),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 223, 223, 223)),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              onSaved: (value) {
                                detalle = value.toString();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Llene este campo';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Confirmar
                    Container(
                      child: FilledButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            if (turno) {
                              Tarea t = new Tarea(
                                  titulo: titulo,
                                  detalle: detalle,
                                  estado: estado);
                              addTarea(t).then((value) {
                                if (value.id != '') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            HomePage("Lunes")),
                                  );
                                }
                              });
                            } else {
                              Tarea t = new Tarea(
                                  id: id,
                                  titulo: titulo,
                                  detalle: detalle,
                                  estado: estado);
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
                            }
                          }
                        },
                        child: const Text('CONFIRMAR'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(58, 162, 120, 1))),
                      ),
                    ),
                    //Cancelar
                    Container(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage("Lunes")),
                          );
                        },
                        child: const Text(' CANCELAR '),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(150, 0, 24, 1))),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
