import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _correo = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Alto';

  final TextEditingController _inputFileDateController =
      TextEditingController();

  final List<String> _caracteristicas = [
    'Alto',
    'Bajo',
    'Relleno',
    'Delgado',
    'Moreno',
    'Blanco'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropDown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre de la persona',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFileDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: const Icon(Icons.date_range),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFileDateController.text = _fecha;
      });
    }
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Correo: $_correo'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Correo de la persona',
        labelText: 'Correo',
        helperText: 'Sólo es el correo de la persona',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _correo = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Contraseña de la persona',
        labelText: 'Contraseña',
        suffixIcon: const Icon(Icons.password),
        icon: const Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  List<DropdownMenuItem<String>> opcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    for (var caracteristica in _caracteristicas) {
      lista.add(
        DropdownMenuItem(
          value: caracteristica,
          child: Text(caracteristica),
        ),
      );
    }
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        DropdownButton<String>(
          value: _opcionSeleccionada,
          items: opcionesDropdown(),
          onChanged: (option) {
            setState(() {
              _opcionSeleccionada = option!;
            });
          },
        )
      ],
    );
  }
}
