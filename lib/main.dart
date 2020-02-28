import 'package:flutter/material.dart';
import 'package:hello/cupertino.dart';
import 'package:hello/estado.dart';

void main() => runApp(Aplicacion());


class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaPrincipal(),
    );
  }
  
}


class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.account_circle, size: 48,),
                    radius: 48,
                  ),
                  SizedBox(height: 16,),
                  Text('usuario@correo.com')
                ],
              ),
            ),
            ListTile(
              title: Text('Pantalla Cupertino'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PantallaCupertino()
                ));
              },
            ),
            ListTile(
              title: Text('Pantalla con estado'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (_) => PantallaConEstado()
                ));
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (_, index) {
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Elemento ${index + 1}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.done),
        onPressed: () => print('Haz hecho click'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void click() {
    print('Estoy fuera del metodo build');
  }
}