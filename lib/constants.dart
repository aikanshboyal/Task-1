import 'package:flutter/material.dart';


const TextStyle koptionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink);

const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: koptionStyle,
  ),
  Text(
    'Index 1: Chats',
    style: koptionStyle,
  ),
  Text(
    'Index 2: Messages',
    style: koptionStyle,
  ),
  Text(
    'Index 3: Profile',
    style: koptionStyle,
  ),
];

const ksubHeadingPink = TextStyle(
  color: Colors.pink,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

TextStyle ksubHeadingGrey = TextStyle(
  color: Colors.grey[300],
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
