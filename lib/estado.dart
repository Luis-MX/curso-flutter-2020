import 'package:flutter/material.dart';

class PantallaConEstado extends StatefulWidget {
  @override
  _PantallaConEstadoState createState() => _PantallaConEstadoState();
}

class _PantallaConEstadoState extends State<PantallaConEstado> {
  int numero = 0;
  bool encendido = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla con estado'),
      ),
      body: Container(
        color: encendido ? Colors.blue : Colors.grey,
        height: 350,
        width: 350,
        child: Text('$numero'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            numero ++;
            encendido = !encendido;
          });
          print(numero);
        },
      ),
    );
  }
}
