import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarAlerta(context),
          child: const Text('Mostrar Alerta'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: const StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_previous),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop()),
              TextButton(
                  child: const Text('Ok'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
  }
}
