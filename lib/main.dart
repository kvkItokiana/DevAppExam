import 'package:flutter/material.dart';
import 'package:testdeux/pages/home.dart';
import 'package:testdeux/pages/loading.dart';
import 'package:testdeux/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home("AUCUN PAYS SELECTIONNE", "AUCUN HEURE", "NO TIME", false),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}


