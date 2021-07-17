import 'package:rxdart/rxdart.dart';

class MultiplicacionBloc {
  // controladores
  final numero1Controller = BehaviorSubject<String>();
  final numero2Controller = BehaviorSubject<String>();
  final resultadoController = BehaviorSubject<String>();

  // Streams,son los flujos de iformacion
  Stream<String> get numero1Stream => numero1Controller.stream;
  Stream<String> get numero2Stream => numero2Controller.stream;
  Stream<String> get resultadoStream => resultadoController.stream;

  //cerrar streams

  dispose() {
    numero1Controller.close();
    numero2Controller.close();
    resultadoController.close();
  }
}
