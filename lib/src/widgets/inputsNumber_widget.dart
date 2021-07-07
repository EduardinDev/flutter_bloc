import 'package:flutter/material.dart';
import 'package:flutter_ejerciciobloc/src/bloc/resta_bloc.dart';
import 'package:flutter_ejerciciobloc/src/util/operaciones.dart' as op;
import 'package:rxdart/rxdart.dart';

final restaBloc = new RestaBloc();

Widget numero(
    {required Stream<String> stream,
    required BehaviorSubject<String> controllernumero1,
    required BehaviorSubject<String> controllernumero2,
    required String tiponum,
    required BehaviorSubject<String> changeresultado,
    required String operacion}) {
  print('valor= ' + controllernumero1.value);
  
  return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: tiponum == 'n2' ? 'Número 2' : 'Número 1'),
          onChanged: (value) {
            _tipoInput(controllernumero1, controllernumero2,tiponum, value, operacion, changeresultado);
          },
        );
      });
}

_tipoInput(
    controllerNumero1, controllerNumero2,tipo, value, operacion, changeResultado) {
  if (tipo == 'n1') {


    if (value != '') {
      controllerNumero1.sink.add(value);
      print('num uno: ' + controllerNumero1.value);
      op.operacionesBasicas(operacion, changeResultado, controllerNumero1.value, controllerNumero2.value);
    } else {
      controllerNumero1.sink.add('0');
      op.operacionesBasicas(operacion, changeResultado, controllerNumero1.value, controllerNumero2.value);
    }


  } else if (tipo == 'n2') {


    if (value != '') {
      controllerNumero2.sink.add(value);
      //print('num dos: '+value);
      op.operacionesBasicas(operacion, changeResultado, controllerNumero1.value, controllerNumero2.value);
    } else {
      controllerNumero2.sink.add('0');
      op.operacionesBasicas(operacion, changeResultado, controllerNumero1.value, controllerNumero2.value);
    }
  }
}
