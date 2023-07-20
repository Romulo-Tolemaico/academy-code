import 'package:flutter/material.dart';
import 'package:waterc/src/apuntes.dart';
import 'package:waterc/src/horario.dart';
import 'package:waterc/src/info.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String dia;
  HomePage(this.dia);
  @override
  State<HomePage> createState() => _HomePageState(dia);
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String dia;
  _HomePageState(this.dia);
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromRGBO(18, 16, 18, 1),
              title: const Text(
                'ACADEMY NOTE',
                style: TextStyle(
                    color: Color.fromRGBO(58, 162, 120, 1), fontSize: 20),
              ),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Color.fromRGBO(58, 162, 120, 1),
                indicatorWeight: 2,
                controller: controller,
                tabs: [
                  Text(
                    'HORARIOS',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  Text(
                    'TAREAS',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(248, 248, 248, 1),
                    ),
                  ),
                  Text(
                    'INFO',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              )),
        ),
        //Cuerpo
        body: TabBarView(
          controller: controller,
          children: [
            Horario(dia),
            Apuntes(),
            Informacion(),
          ],
        ),
      );
}
