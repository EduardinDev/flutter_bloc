import 'package:rxdart/rxdart.dart';

class RestaBloc {
  RestaBloc() {
     numero1Controller.sink.add('0');
     numero2Controller.sink.add('0');
  }

  // controladores
  final numero1Controller   = BehaviorSubject<String>();
  final numero2Controller   = BehaviorSubject<String>();
  final resultadoController = BehaviorSubject<String>();

  // streams, son los flujos de información

  Stream<String> get numero1Stream   => numero1Controller.stream;
  Stream<String> get numero2Stream   => numero2Controller.stream;
  Stream<String> get resultadoStream => resultadoController.stream;


  dispose() {
    numero1Controller.close();
    numero2Controller.close();
    resultadoController.close();
  }
}
