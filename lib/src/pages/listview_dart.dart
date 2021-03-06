import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _add10Images();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_add10Images();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPages1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];

          return FadeInImage(
            image: NetworkImage('https://i.picsum.photos/id/$image/500/300.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },

      ),
    );
  }

  Future <Null> getPages1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _add10Images();
    });

    return Future.delayed(duration);
  }

  _add10Images() {
    setState(() {
      for (var i = 0; i <= 10; i++) {
        _lastItem++;
        _numberList.add(_lastItem);
      }
    });
  }

  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {

    });

    final duration = new Duration(seconds: 2);
    new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );

    _add10Images();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
