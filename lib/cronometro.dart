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
            builder: (_) => PantallaOptimizada()
          ));
        },
      ),
    );
  }
}

class PantallaOptimizada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('construyendo pantalla');
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Optimizada'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CronometroWidget(),
            SizedBox(height: 24,),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                //
              },
            )
          ],
        ),
      ),
    );
  }
}

class CronometroWidget extends StatefulWidget {
  @override
  _CronometroWidgetState createState() => _CronometroWidgetState();
}

class _CronometroWidgetState extends State<CronometroWidget> {

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
    int minutos = segundos ~/ 60;
    int segundosPantalla = segundos % 60;
    print('construyendo cronometro');
    return GestureDetector(
      onTap: () {
        setState(() {
          segundos = 0;
        });
      },
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
    );
  }
}
