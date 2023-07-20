import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(65, 62, 64, 1),
      body: Center(
        child: Container(
            width: 255,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: Text("Sobre nuestros planes",
                        style: TextStyle(color: Colors.white))),
                Container(
                    child: Text(
                        "Esto es solo el comienzo y el futuro es mucho más interesante.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 223, 223, 223)),
                        textAlign: TextAlign.center)),
                Container(
                    child: Text("una versión futura de la aplicación incluirá",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 255,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(102, 98, 100, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/documento.png',
                          scale: 20,
                          color: const Color.fromRGBO(58, 162, 120, 1),
                        ),
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            "Permitira a los usuarios crear carpetas y guardar archivos correspondientes a esta.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 255,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(102, 98, 100, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/agregar_usuario.png',
                          scale: 20,
                          color: const Color.fromRGBO(58, 162, 120, 1),
                        ),
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            "Ahora todos los usuarios podran crear una cuenta para poder alamacenar sus recursos.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 255,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(102, 98, 100, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/campana.png',
                          scale: 20,
                          color: const Color.fromRGBO(58, 162, 120, 1),
                        ),
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            "La aplicacion ahora podra enviar notificaciones sobre los eventos importantes del usuario.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 255,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(102, 98, 100, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/usuarios.png',
                          scale: 20,
                          color: const Color.fromRGBO(58, 162, 120, 1),
                        ),
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            "Ahora podra compartir recursos con otros usuarios en la comunidad.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 255,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(102, 98, 100, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/libro_marcador.png',
                          scale: 20,
                          color: const Color.fromRGBO(58, 162, 120, 1),
                        ),
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            "Ahora con la biblioteca usted podra encontrar el recurso demandado por su persona o tambien podra usted colaborar con la biblioteca.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                    child: Text(
                        "siempre estamos abiertos a escuchar su sugerencia e informes sobre problemas",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color.fromRGBO(58, 162, 120, 1)))),
              ],
            )),
      ),
    );
  }
}
