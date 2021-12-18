import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final response = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(response);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

// ignore: unnecessary_new
final menuProvider = new _MenuProvider();
