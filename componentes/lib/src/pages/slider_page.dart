import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            _crearSlider(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _value,
      min: 10.0,
      max: 400.0,
      onChanged: (valor) {
        setState(() {
          _value = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: const NetworkImage(
          'https://static.zerochan.net/Eren.Jaeger.full.3204659.png'),
      width: _value,
      fit: BoxFit.contain,
    );
  }
}
