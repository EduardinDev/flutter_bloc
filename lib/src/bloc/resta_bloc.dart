import 'package:rxdart/rxdart.dart';

class RestaBloc {
  RestaBloc() {
    changeNumero1('0');
    changeNumero2('0');
  }

  // controladores
  final numero1Controller = BehaviorSubject<String>();
  final numero2Controller = BehaviorSubject<String>();
  final resultadoController = BehaviorSubject<String>();

  // streams, son los flujos de información

  Stream<String> get numero1Stream => numero1Controller.stream;
  Stream<String> get numero2Stream => numero2Controller.stream;
  Stream<String> get resultadoStream => resultadoController.stream;

  // insersores

  Function(String) get changeNumero1 => numero1Controller.sink.add;
  Function(String) get changeNumero2 => numero2Controller.sink.add;
  Function(String) get changeResultado => resultadoController.sink.add;

  // obtener ultimo valor ingresado en el stream

  String get numero1 => numero1Controller.value;
  String get numero2 => numero2Controller.value;
  String get resultado => resultadoController.value;

  // operacion resta

 /*  operacionResta() {
    int resta = int.parse(numero1) - int.parse(numero2);
    changeResultado(resta.toString());
  } */

  dispose() {
    numero1Controller.close();
    numero2Controller.close();
    resultadoController.close();
  }
}
