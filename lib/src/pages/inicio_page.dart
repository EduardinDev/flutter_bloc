import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplos bloc'),
      ),
      body: _opciones(context),
    );

  }

  Widget _opciones(BuildContext context) {
    return ListView(
      children: <Widget>[
        _suma(context),
        _resta(context)
      ],
    );
  }

  Widget _suma(BuildContext context) {
    return ListTile(
      title: Text('Suma de dos números'),
      subtitle: Text('Utilizando bloc'),
      onTap: () {
        Navigator.pushNamed(context, 'suma');
      },
    );
  }
  Widget _resta(BuildContext context) {
    return ListTile(
      title: Text('Resta de dos números'),
      subtitle: Text('Utilizando bloc'),
      onTap: () {
        Navigator.pushNamed(context, 'resta');
      },
    );
  }
}
