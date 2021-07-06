import 'package:rxdart/rxdart.dart';

class RestaBloc {
  RestaBloc() {
    changeNumero1('0');
    changeNumero2('0');
  }

  // controladores
  final _numero1Controller = BehaviorSubject<String>();
  final _numero2Controller = BehaviorSubject<String>();
  final _resultadoController = BehaviorSubject<String>();

  // streams, son los flujos de información

  Stream<String> get numero1Stream => _numero1Controller.stream;
  Stream<String> get numero2Stream => _numero2Controller.stream;

  // insersores

  Function(String) get changeNumero1 => _numero1Controller.sink.add;
  Function(String) get changeNumero2 => _numero2Controller.sink.add;
  Function(String) get changeResultado => _resultadoController.sink.add;

  // obtener ultimo valor ingresado en el stream

  String get numero1 => _numero1Controller.value;
  String get numero2 => _numero2Controller.value;
  String get resultado => _resultadoController.value;

  dispose() {
    _numero1Controller.close();
    _numero2Controller.close();
    _resultadoController.close();
  }
}
