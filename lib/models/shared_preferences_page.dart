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
  String? nombreGuardado;

  Future<void> guardarNombre() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("nombre", _nombreController.text);
    _nombreController.clear();
    setState(() {});
  }

  Future<void> cargarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    final nombre = prefs.getString("nombre") ?? "Aún no hay un nombre guardado";
    nombreGuardado = nombre;
    setState(() {});
  }

  @override
  void initState() {
    cargarNombre();
    super.initState();
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
              ElevatedButton(
                onPressed: () {
                  guardarNombre();
                },
                child: Text("Guardar nombre"),
              ),
              ElevatedButton(
                onPressed: () {
                  cargarNombre();
                },
                child: Text("Cargar nombre"),
              ),
              SizedBox(height: 32),
              Text(
                "Nombre guardado: ${nombreGuardado}",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
