import 'package:flutter/material.dart';
import 'package:flutter_ejerciciobloc/src/bloc/suma_bloc.dart';
import 'package:flutter_ejerciciobloc/src/widgets/inputsNumber_widget.dart' as input;
import 'package:flutter_ejerciciobloc/src/widgets/contenedores_widget.dart'
    as contenedor;

class SumaPage extends StatelessWidget {
  final sumaBloc = new SumaBloc();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Suma bloc'),
      ),
      body: suma(),
    );
  }

  Widget suma() {
    //_valor();
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            input.numero(
              stream: sumaBloc.numero1Stream,
              controllernumero1: sumaBloc.numero1Controller,
              controllernumero2: sumaBloc.numero2Controller,
              tiponum: 'n1',
              operacion: 'suma',
              changeresultado: sumaBloc.resultadoController
              ),
            SizedBox(
              height: 20.0,
            ),
            input.numero(
              stream: sumaBloc.numero2Stream,
              controllernumero1: sumaBloc.numero1Controller,
              controllernumero2: sumaBloc.numero2Controller,
              tiponum: 'n2',
              operacion: 'suma',
              changeresultado: sumaBloc.resultadoController
              ),
            SizedBox(
              height: 20.0,
            ),
            _resultado()
          ],
        ));
  }


 _resultado() {
    return StreamBuilder(
        stream: sumaBloc.resultadoStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data != null) {
            return contenedor.contenedorRespuesta(snapshot.data);
          } else {
            return contenedor.contenedorRespuesta('0');
          }
        });
  }

  
}
