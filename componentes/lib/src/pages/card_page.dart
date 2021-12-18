import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.camera_enhance_outlined),
            title: Text('CARD CAMARA'),
            subtitle: Text(
                'Card con texto referenta a una camara, incluyendo un icono de la misma tematica, con sus respectivos botones'),
          ),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('OK'),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Column(
      children: <Widget>[
        const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://photographylife.com/wp-content/uploads/2020/03/Dan-Ballard-Landscapes-6.jpg'),
          fadeInDuration: Duration(milliseconds: 300),
          height: 300,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: const Text('soy un texto'),
        )
      ],
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(2.0, 10.0)),
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
