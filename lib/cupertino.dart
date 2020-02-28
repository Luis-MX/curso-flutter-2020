import 'package:flutter/cupertino.dart';


class PantallaCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Estilo Apple'),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.add),
          padding: const EdgeInsets.all(0.0),
          onPressed: () {},
        ),
      ),
      child: Center(
        child: CupertinoSwitch(
          value: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}