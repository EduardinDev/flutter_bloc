import 'package:flutter/material.dart';
import 'package:flutter_ejerciciobloc/src/bloc/resta_bloc.dart';
import 'package:flutter_ejerciciobloc/src/widgets/contenedores_widget.dart'
    as contenedor;
import 'package:flutter_ejerciciobloc/src/widgets/inputsNumber_widget.dart'
    as input;

class RestaPage extends StatelessWidget {
  final restaBloc = new RestaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resta Bloc'),
      ),
      body: _resta(),
    );
  }

  _resta() {
    //restaBloc.numero1Controller.sink.add('2');
    //restaBloc.numero2Controller.sink.add('5');
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          input.numero(
              stream: restaBloc.numero1Stream,
              controllernumero1: restaBloc.numero1Controller,
              controllernumero2: restaBloc.numero2Controller,
              tiponum: 'n1',
              changeresultado: restaBloc.resultadoController,
              operacion: 'resta'),
          SizedBox(
            height: 15.0,
          ),
          input.numero(
              stream: restaBloc.numero2Stream,
              controllernumero1: restaBloc.numero1Controller,
              controllernumero2: restaBloc.numero2Controller,
              tiponum: 'n2',
              changeresultado: restaBloc.resultadoController,
              operacion: 'resta'),
          SizedBox(
            height: 15.0,
          ),
          _resultado(),
        ],
      ),
    );
  }

  _resultado() {
    return StreamBuilder(
        stream: restaBloc.resultadoStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data != null) {
            return contenedor.contenedorRespuesta(snapshot.data);
          } else {
            return contenedor.contenedorRespuesta('0');
          }
        });
  }
}
