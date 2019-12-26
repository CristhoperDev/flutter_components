import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem = 0;

  @override
  void initState() {
    super.initState();

    _add10Images();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _add10Images();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index) {
        final image = _numberList[index];

        return FadeInImage(
          image: NetworkImage('https://i.picsum.photos/id/$image/500/300.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  _add10Images() {
    setState(() {
      for (var i = 0; i <= 10; i++) {
        _lastItem++;
        _numberList.add(_lastItem);
      }
    });
  }
}
