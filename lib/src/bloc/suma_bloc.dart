
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class SumaBloc {

// al empezar la aplicación se inicializan los numeros con cero
SumaBloc(){
  numero1Controller.sink.add('0');
  numero2Controller.sink.add('0');
}

  // los controladores de los stream
  final numero1Controller   = BehaviorSubject<String>();
  final numero2Controller   = BehaviorSubject<String>();
  final resultadoController = BehaviorSubject<String>();

  // los streams de los controladores
  Stream<String> get numero1Stream   => numero1Controller.stream;
  Stream<String> get numero2Stream   => numero2Controller.stream;
  Stream<String> get resultadoStream => resultadoController.stream;

 
  // cerrar los streams
  // nota: si no se cierran entonces volveran a crearse
  // cada vez que se inicie la clase en donde se los instancio
  void dispose() {
    numero1Controller.close();
    numero2Controller.close();
    resultadoController.close();
  }
}
