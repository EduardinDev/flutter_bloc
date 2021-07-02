import 'package:flutter/material.dart';
import 'package:flutter_ejerciciobloc/src/bloc/suma_bloc.dart';

class SumaPage extends StatelessWidget {
  final sumaBloc = new SumaBloc();

  @override
  Widget build(BuildContext context) {
    //sumaBloc.cargarValoresIniciales();
    //print(sumaBloc.numero1.toString());
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
            _numero1(),
            SizedBox(
              height: 20.0,
            ),
            _numero2(),
            SizedBox(
              height: 20.0,
            ),
            _respuestaStream()
          ],
        ));
  }

  _numero1() {
    return StreamBuilder(
      stream: sumaBloc.numero1Stream,
      builder: (context, AsyncSnapshot<int> snapshot) {
        return TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'número 1', errorText: snapshot.error?.toString()),
          onChanged: (value) {
            if (value != '') {
              sumaBloc.changeNumero1(int.parse(value));
              //sumaBloc.sumarNumeros();
            } else {
              sumaBloc.changeNumero1(0);
              //sumaBloc.sumarNumeros();
            }
          },
        );
      },
    );
  }

  _numero2() {
    return StreamBuilder(
      stream: sumaBloc.numero2Stream,
      builder: (context, AsyncSnapshot<int> snapshot) {

        return TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'número 2'),
          onChanged: (value) {
            if (value != '') {
              sumaBloc.changeNumero2(int.parse(value));
              //sumaBloc.sumarNumeros();             
            } else {
              sumaBloc.changeNumero2(0);
              //sumaBloc.sumarNumeros();
            }
          },
        );
      },
    );
  }

  _respuestaStream() {
    return StreamBuilder(
        stream: sumaBloc.validacion,
        builder: (context, AsyncSnapshot<int> snapshot) {

          if (snapshot.data!=null) {
            print(snapshot.data);
            return _resultado(snapshot.data);
          } else {
            return _resultado('sin valores');
          }
        });
  }

  _resultado(respuesta) {
    return Container(
        margin: EdgeInsets.all(15.0),
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(respuesta.toString()),
        ));
  }
}
