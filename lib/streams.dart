

import 'package:flutter/material.dart';
import 'package:hello/cronometro.dart';

class PantallaConStream extends StatefulWidget {
  @override
  _PantallaConStreamState createState() => _PantallaConStreamState();
}

class _PantallaConStreamState extends State<PantallaConStream> {
  @override
  Widget build(BuildContext context) {
    print('Construyendo solo una vez');
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
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
                setState(() {
                });
              },
            )
          ],
        ),
      ),
    );
  }
}