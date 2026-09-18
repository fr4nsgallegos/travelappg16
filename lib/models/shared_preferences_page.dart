import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  TextEditingController _nombreController = TextEditingController();
  int contador = 0;

  Future<void> guardarNombre() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("nombre", _nombreController.text);
    _nombreController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contador++;
          setState(() {});
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(contador.toString(), style: TextStyle(fontSize: 35)),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: "Escribe tu nombre",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(onPressed: () {}, child: Text("Guardar nombre")),
              SizedBox(height: 32),
              Text(
                "Nombre guardado: ${_nombreController.text}",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
