import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _checkBlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image size',
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_checkBlock) ? null : ( value ) => setState(() {
        _sliderValue = value;
      }),
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG111.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    /*return Checkbox(
      value: _checkBlock,
      onChanged: (value) => setState(() {
        _checkBlock = value;
      }),
    );*/
    return CheckboxListTile(
      title: Text('Block slider'),
      value: _checkBlock,
      onChanged: (value) => setState(() {
        _checkBlock = value;
      }),
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block slider'),
      value: _checkBlock,
      onChanged: (value) => setState(() {
        _checkBlock = value;
      }),
    );
  }
}
