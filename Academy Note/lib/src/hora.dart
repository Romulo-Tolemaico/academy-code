class Hora {
  List<String> dias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Viernes",
    "Sabado",
    "Domingo"
  ];
  bool compararHora(String horaInicio, String horaFinal, String dia) {
    var obtenido = DateTime.now();
    final diaSemana = DateTime.parse(obtenido.toString());
    String hora = obtenido.hour < 10
        ? "0" + obtenido.hour.toString()
        : obtenido.hour.toString();
    String minuto = obtenido.minute < 10
        ? "0" + obtenido.minute.toString()
        : obtenido.minute.toString();
    String horaActual = hora + ":" + minuto;

    return horaActual.compareTo(horaInicio) >= 0 &&
        horaActual.compareTo(horaFinal) <= 0 &&
        dias[diaSemana.weekday - 1].compareTo(dia) == 0;
  }
}
