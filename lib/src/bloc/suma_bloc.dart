
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class SumaBloc {

// al empezar la aplicación se inicializan los numeros con cero
SumaBloc(){
  changeNumero1('0');
  changeNumero2('0');
}

  // los controladores de los stream
  final numero1Controller = BehaviorSubject<String>();
  final numero2Controller = BehaviorSubject<String>();
  final resultadoController = BehaviorSubject<String>();

  // los streams de los controladores
  Stream<String> get numero1Stream => numero1Controller.stream;
  Stream<String> get numero2Stream => numero2Controller.stream;
  Stream<String> get resultadoStream => resultadoController.stream;

  // Insersores de valores a los streams
  Function(String) get changeNumero1 => numero1Controller.sink.add;
  Function(String) get changeNumero2 => numero2Controller.sink.add;
  Function(String) get changeResultado => resultadoController.sink.add;

  // obtener ultimos valores de los streams
  String get numero1 => numero1Controller.value;
  String get numero2 => numero2Controller.value;
  String get resultado => resultadoController.value;

  // sumar valores
  sumarNumeros() {
    int operacion = int.parse(numero1) + int.parse(numero2);
    changeResultado(operacion.toString());
  }

  // cerrar los streams
  // nota: si no se cierran entonces volveran a crearse
  // cada vez que se inicie la clase en donde se los instancio
  void dispose() {
    numero1Controller.close();
    numero2Controller.close();
    resultadoController.close();
  }
}
