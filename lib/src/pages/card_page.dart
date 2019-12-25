import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30),
          _cardType2()
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card title'),
            subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam blandit nibh nisl, a sodales neque volutpat vel. Aenean pharetra dapibus.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: null, child: Text('Cancelar')),
              FlatButton(onPressed: null, child: Text('OK')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://miro.medium.com/max/4320/0*QNdQhs_T3ffa6B0m.jpeg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /*Image(
            image: NetworkImage('https://miro.medium.com/max/4320/0*QNdQhs_T3ffa6B0m.jpeg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Image')
          ),
        ],
      ),
    );
  }
}
