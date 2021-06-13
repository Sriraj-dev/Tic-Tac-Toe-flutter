import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Scene/gameplay.dart';
import 'package:tic_tac_toe/Scene/gameplay2.dart';
import 'package:tic_tac_toe/Scene/home.dart';
import 'package:tic_tac_toe/Scene/over.dart';
import 'package:tic_tac_toe/Scene/select.dart';
import 'package:tic_tac_toe/Scene/select2.dart';

//import 'package:tic_tac_toe/Scene/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/result': (context) => Over(),
      '/home': (context) => Home(),
      '/select': (context) => Select(),
      '/Game': (context) => Game(),
      '/select2': (context) => Select2(),
      '/Game2': (context) => Game2(),
    },
  ));
}
