import 'dart:async';

import 'package:flutter/material.dart';

class PantallaCronometro extends StatefulWidget {
  @override
  _PantallaCronometroState createState() => _PantallaCronometroState();
}

class _PantallaCronometroState extends State<PantallaCronometro> {

  int segundos = 0;
  StreamSubscription _cronometro;

  @override
  void initState() {
    super.initState();
    _cronometro = Stream.periodic(Duration(seconds: 1), actualizacion)
      .listen(null);
  }

  @override
  void dispose() {
    _cronometro.cancel();
    super.dispose();
  }

  void actualizacion(int index) {
    setState(() {
      segundos ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Pantalla reconstruyendose');
    int minutos = segundos ~/ 60;
    int segundosPantalla = segundos % 60;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronometro'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.indigo,
          ),
          child: Text(
            '${minutos.toString().padLeft(2, "0")}:${segundosPantalla.toString().padLeft(2, "0")}', 
            style: TextStyle(fontSize: 32, color: Colors.white),
            ),
        ),
      ),
      floatingActionButton: RawMaterialButton(
        fillColor: Colors.indigo,
        shape: StadiumBorder(),
        padding: const EdgeInsets.all(16.0),
        child: Text('Patalla optimizada', style: TextStyle(color: Colors.white, fontSize: 24),),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Pantalla optimizada'),
              ),
              body: Center(
                child: TextField(),
              ),
            )
          ));
        },
      ),
    );
  }
}