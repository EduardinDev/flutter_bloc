import 'package:flutter/material.dart';
import 'package:flutter_ejerciciobloc/src/bloc/resta_bloc.dart';

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
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _numero1(),
          SizedBox(
            height: 15.0,
          ),
          _numero2(),
          SizedBox(
            height: 15.0,
          ),
          _resultado(),
        ],
      ),
    );
  }

  Widget _numero1() {
    return StreamBuilder(
        stream: restaBloc.numero1Stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Número 1'),
            onChanged: (value) {
              if (value != '') {
                restaBloc.changeNumero1(value);
                restaBloc.operacionResta();
              } else {
                restaBloc.changeNumero1('0');
                restaBloc.operacionResta();
              }
            },
          );
        });
  }

  Widget _numero2() {
    return StreamBuilder(
        stream: restaBloc.numero2Stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Número 2'),
            onChanged: (value) {
              if (value != '') {
                restaBloc.changeNumero2(value);
                restaBloc.operacionResta();
              } else {
                restaBloc.changeNumero2('0');
                restaBloc.operacionResta();
              }
            },
          );
        });
  }

  _resultado() {
    return StreamBuilder(
        stream: restaBloc.resultadoStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.data != null) {
            return _contenedorRespuesta(snapshot.data);
          } else {
            return _contenedorRespuesta('0');
          }
        });
  }

  Container _contenedorRespuesta(respuesta) {
    return Container(
        margin: EdgeInsets.all(15.0),
        height: 50.0,
        decoration: BoxDecoration(border: Border.all()),
        child: Center(
          child: Text(respuesta),
        ));
  }
}
