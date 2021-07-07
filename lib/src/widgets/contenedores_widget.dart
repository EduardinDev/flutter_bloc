import 'package:flutter/material.dart';



 Container contenedorRespuesta(respuesta) {
    return Container(
        margin: EdgeInsets.all(15.0),
        height: 50.0,
        decoration: BoxDecoration(border: Border.all()),
        child: Center(
          child: Text(respuesta),
        ));
  }