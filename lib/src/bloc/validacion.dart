import 'dart:async';

class Validacion {
  final validarNumero =
      StreamTransformer<int, int>.fromHandlers(handleData: (numero, sink) {
    if (numero >= 0) {
      sink.add(numero);
    } else {
      sink.add( 0 ); // si esque no hay numeros entonces agregar cero por defecto
    }
  });
}
