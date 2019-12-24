import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _CrearItems()
      ),
    );
  }

  List<Widget> _CrearItems() {
    List<Widget> list = new List<Widget>();
    for (String opt in options) {
      final tempWidget = ListTile(
      title: Text(opt),
      );
      list..add(tempWidget)
          ..add(Divider());
    }

    return list;
  }
}
