import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://static.vix.com/es/sites/default/files/styles/1x1/public/r/rip-stan-lee.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://media.metrolatam.com/2019/05/13/stanleegettygabr-144d627874f166d726634dc81195a317.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
