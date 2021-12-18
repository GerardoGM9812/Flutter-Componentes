import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  ListaPageState createState() => ListaPageState();
}

class ListaPageState extends State<ListaPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _IsLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarImagenes();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarImagenes();
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
        title: const Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _recargarPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
          );
        },
      ),
    );
  }

  void _agregarImagenes() {
    for (int i = 1; i <= 10; i++) {
      _listaNumeros.add(_ultimoItem++);
    }
    setState(() {});
  }

  Future fetchData() async {
    _IsLoading = true;
    setState(() {});
    return Timer(const Duration(seconds: 2), respuestaHTTP);
  }

  void respuestaHTTP() {
    _IsLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 50,
      duration: const Duration(microseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _agregarImagenes();
  }

  Widget _crearLoading() {
    if (_IsLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          const Padding(padding: EdgeInsets.all(15.0))
        ],
      );
    } else {
      return Container();
    }
  }

  Future _recargarPagina() async {
    Timer(const Duration(seconds: 2), () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarImagenes();
    });

    return Future.delayed(const Duration(seconds: 2));
  }
}
