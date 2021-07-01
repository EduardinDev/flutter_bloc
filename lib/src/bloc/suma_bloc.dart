import 'package:rxdart/subjects.dart';

class SumaBloc {
  // los controladores de los stream
  final _numero1Controller = BehaviorSubject<int>();
  final _numero2Controller = BehaviorSubject<int>();

  // los streams de los controladores
  Stream<int> get numero1Stream => _numero1Controller.stream;
  Stream<int> get numero2Stream => _numero2Controller.stream;

  // Insersores de valores a los streams
  Function(int) get changeNumero1 => _numero1Controller.sink.add;
  Function(int) get changeNumero2 => _numero2Controller.sink.add;

  // obtener ultimos valores de los streams

  int get numero1 => _numero1Controller.value;
  int get numero2 => _numero2Controller.value;


 // cerrar los streams
 // nota: si no se cierran entonces volveran a crearse
 // cada vez que se inicie la clase en donde se los instancio
  void dispose() {
    _numero1Controller.close();
    _numero2Controller.close();
  }
}
