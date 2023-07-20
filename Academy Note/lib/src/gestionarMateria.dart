import 'package:flutter/material.dart';
import 'package:waterc/modelos/materias.model.dart';
import 'package:waterc/peticiones/materias.peticiones.dart';
import 'package:waterc/src/home_page.dart';

// ignore: must_be_immutable
class GestionarMateria extends StatelessWidget {
  String tituloGeneral, id, nombre, diaSelect;
  String hr1 = "", min1 = "", hr2 = "", min2 = "", dia = "";
  bool turno;
  List<String> listaDias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes",
    "Sabado",
    "Domingo"
  ];
  List<String> listaHoras = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23"
  ];
  List<String> listaMinutos = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
  ];
  final formkey = GlobalKey<FormState>();
  GestionarMateria(
      this.tituloGeneral, this.id, this.nombre, this.turno, this.diaSelect);

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
                  //Nombre del temas
                  Container(
                    child: Text(
                      tituloGeneral,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //Ingresar Dia
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'DIA',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                            width: 85,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(58, 162, 120, 1)),
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              margin: const EdgeInsets.all(2.0),
                              width: 75,
                              height: 50,
                              alignment: Alignment.center,
                              child: DropdownButtonFormField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                itemHeight: 48,
                                iconEnabledColor:
                                    Color.fromRGBO(92, 203, 95, 1),
                                iconDisabledColor:
                                    Color.fromRGBO(92, 203, 95, 1),
                                dropdownColor: Color.fromRGBO(37, 37, 37, 1),
                                items: listaDias.map((e) {
                                  return DropdownMenuItem(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        e,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                      ),
                                    ),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  dia = value.toString();
                                },
                                isDense: true,
                                isExpanded: true,
                              ),
                            )),
                      ],
                    ),
                  ),
                  //Ingresar nombre del materia
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'NOMBRE DE LA MATERIA',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(58, 162, 120, 1)),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          cursorColor: Color.fromRGBO(255, 255, 255, 1),
                          initialValue: nombre,
                          style: TextStyle(
                              color: Color.fromARGB(255, 223, 223, 223)),
                          decoration: InputDecoration(border: InputBorder.none),
                          onSaved: (value) {
                            nombre = value.toString();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Llene este campo';
                            }
                            return null;
                          },
                        ),
                      )
                    ]),
                  ),
                  horaDesignada(),
                  Container(
                    child: FilledButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          if (dia != '' &&
                              hr1 != '' &&
                              min1 != '' &&
                              hr2 != '' &&
                              min2 != '') {
                            if (turno) {
                              Materia m = new Materia(
                                  dia: dia,
                                  nombre: nombre,
                                  inicio: hr1 + ":" + min1,
                                  end: hr2 + ":" + min2);
                              addMateria(m).then((value) {
                                if (value.id != '') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            HomePage(diaSelect)),
                                  );
                                }
                              });
                            } else {
                              Materia m = new Materia(
                                  id: id,
                                  dia: dia,
                                  nombre: nombre,
                                  inicio: hr1 + ":" + min1,
                                  end: hr2 + ":" + min2);
                              modificarMateria(m).then((value) {
                                if (value.id != '') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            HomePage(diaSelect)),
                                  );
                                }
                              });
                            }
                          } else {
//No definido
                          }
                        }
                      },
                      child: const Text(' CONFIRMAR '),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(58, 162, 120, 1))),
                    ),
                  ),
                  Container(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => HomePage(diaSelect)),
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
          ),
        ));
  }

  Widget horaDesignada() {
    return Container(
        child: Column(
      children: [
        Container(
          child: Text(
            'HORA',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Container(
          child: Row(
            children: [iniH(), finH()],
          ),
        ),
      ],
    ));
  }

  Widget iniH() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Container(
            child: Text(
              'INICIO',
              style: TextStyle(
                  color: Color.fromARGB(255, 223, 223, 223), fontSize: 12),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(58, 162, 120, 1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 40,
                      height: 50,
                      alignment: Alignment.center,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        itemHeight: 48,
                        iconEnabledColor: Color.fromRGBO(92, 203, 95, 1),
                        iconDisabledColor: Color.fromRGBO(92, 203, 95, 1),
                        dropdownColor: Color.fromRGBO(37, 37, 37, 1),
                        items: listaHoras.map((e) {
                          return DropdownMenuItem(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                e,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                          hr1 = value.toString();
                        },
                        isDense: true,
                        isExpanded: true,
                      ),
                    )),
                Container(
                    child: Text(
                  ' : ',
                  style: TextStyle(
                      color: Color.fromRGBO(92, 203, 95, 1), fontSize: 30),
                )),
                Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(58, 162, 120, 1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 40,
                      height: 50,
                      alignment: Alignment.center,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        itemHeight: 48,
                        iconEnabledColor: Color.fromRGBO(92, 203, 95, 1),
                        iconDisabledColor: Color.fromRGBO(92, 203, 95, 1),
                        dropdownColor: Color.fromRGBO(37, 37, 37, 1),
                        items: listaMinutos.map((e) {
                          return DropdownMenuItem(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                e,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                          min1 = value.toString();
                        },
                        isDense: true,
                        isExpanded: true,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget finH() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            child: Text(
              'FINAL',
              style: TextStyle(
                  color: Color.fromARGB(255, 223, 223, 223), fontSize: 12),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(58, 162, 120, 1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 40,
                      height: 50,
                      alignment: Alignment.center,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        itemHeight: 48,
                        iconEnabledColor: Color.fromRGBO(92, 203, 95, 1),
                        iconDisabledColor: Color.fromRGBO(92, 203, 95, 1),
                        dropdownColor: Color.fromRGBO(37, 37, 37, 1),
                        items: listaHoras.map((e) {
                          return DropdownMenuItem(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                e,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                          hr2 = value.toString();
                        },
                        isDense: true,
                        isExpanded: true,
                      ),
                    )),
                Container(
                    child: Text(
                  ' : ',
                  style: TextStyle(
                      color: Color.fromRGBO(92, 203, 95, 1), fontSize: 30),
                )),
                Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(58, 162, 120, 1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      width: 40,
                      height: 50,
                      alignment: Alignment.center,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        itemHeight: 48,
                        iconEnabledColor: Color.fromRGBO(92, 203, 95, 1),
                        iconDisabledColor: Color.fromRGBO(92, 203, 95, 1),
                        dropdownColor: Color.fromRGBO(37, 37, 37, 1),
                        items: listaMinutos.map((e) {
                          return DropdownMenuItem(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                e,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                          min2 = value.toString();
                        },
                        isDense: true,
                        isExpanded: true,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
