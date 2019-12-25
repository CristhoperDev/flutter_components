import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/util_icon_string.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
//    menuProvider.loadData()
  return FutureBuilder(
    future: menuProvider.loadData(),
    initialData: [],
    builder: (context, AsyncSnapshot< List<dynamic> > snapshot) {
      return ListView(
        children: _createListItems(snapshot.data),
      );
    },
  );
  }

  List<Widget> _createListItems( List<dynamic> data ) {
    final List<Widget> options = [];
    data.forEach( (opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {

        },
      );

      options..add(widgetTemp)
             ..add(Divider());
    });

    return options;
  }
}