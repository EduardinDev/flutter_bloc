operacionesBasicas(operacion, changeResultado, numero1, numero2) {
  switch (operacion) {
    case "resta":
      {
        int resta = int.parse(numero1) - int.parse(numero2);
        changeResultado.sink.add(resta.toString());
      }
      break;

    case "suma":
      {
        int suma = int.parse(numero1) + int.parse(numero2);
        changeResultado.sink.add(suma.toString());
      }
      break;

    default:
      {
        print("Opción invalida");
      }
      break;
  }
}
