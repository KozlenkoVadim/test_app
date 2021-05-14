import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

@override
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 5665465;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Япония, Стaршая Некома'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _buildTopImage(),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildRating(),
                  ),
                  Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: _buildAction(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDesc(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildTopImage() => Container(

    color: _setBackColor(true),
        child: Card(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          elevation: 5,
          child: Image.asset(
            'assets/images/kuro.png',
            fit: BoxFit.cover,
          ),
        ),
      );

  Color _setBackColor(bool _isBackGroundPressed) {
    Random random = new Random();
    List<Color> _colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.black,
      Colors.green,
      Colors.amber,
      Colors.grey,
      Colors.brown,
    ];
    _isBackGroundPressed = _isBackGroundPressed;
    Color _color = Colors.yellow;
    if(_isBackGroundPressed == false) {
      _color = Colors.white;
    } else{
      _color = _colors[random.nextInt(7)];
    }
    return _color;
  }

  Widget _buildRating() => ListTile(
        title: Text(
          'Куро Тецуро',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text('Япония, Старшая Некома'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FavoriteWidget(),
          ],
        ),
      );

  Widget _buildAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton('Блокирующий', Icons.star, Colors.black),
          _buildButton('Рост 188 см', Icons.radio_button_checked, Colors.black),
          _buildButton('Возраст 18', Icons.school, Colors.black),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );

  Widget _buildDesc() => Text(
        'Куро Тецуро - третьекурсник старшей школы Некома. '
        'Капитан мужского волейбольного клуба, играющий на позиции центрального блокирующего.',
        softWrap: true,
        style: TextStyle(
          fontSize: 16.0,
        ),
      );

}
