import 'package:flutter_ejerciciobloc/src/bloc/validacion.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class SumaBloc with Validacion {
  // los controladores de los stream
  final _numero1Controller = BehaviorSubject<int>();
  final _numero2Controller = BehaviorSubject<int>();
  final _resultadoController = BehaviorSubject<int>();

  // los streams de los controladores
  Stream<int> get numero1Stream =>
      _numero1Controller.stream.transform(validarNumero);
  Stream<int> get numero2Stream =>
      _numero2Controller.stream.transform(validarNumero);
 

  // Insersores de valores a los streams
  Function(int) get changeNumero1 => _numero1Controller.sink.add;
  Function(int) get changeNumero2 => _numero2Controller.sink.add;


  // obtener ultimos valores de los streams
  int get numero1 => _numero1Controller.value;
  int get numero2 => _numero2Controller.value;
 

  Stream<int> get validacion =>
      Rx.combineLatest2(numero1Stream, numero2Stream, (a, b) => sumarNumeros());


  // sumar valores
  int sumarNumeros() {
    int operacion = _numero1Controller.value + _numero2Controller.value;
    return operacion;
  }

  // cerrar los streams
  // nota: si no se cierran entonces volveran a crearse
  // cada vez que se inicie la clase en donde se los instancio
  void dispose() {
    _numero1Controller.close();
    _numero2Controller.close();
    _resultadoController.close();
  }
}
