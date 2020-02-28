import 'package:flutter/material.dart';

void main() => runApp(Aplicacion());


class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
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
      ),
    );
  } 

  void click() {
    print('Estoy fuera del metodo build');
  }
  
}