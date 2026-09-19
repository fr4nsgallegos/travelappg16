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
  List<String>? stringList;

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

  Future<void> cargarContador() async {
    final prefs = await SharedPreferences.getInstance();
    final counterAux = prefs.getInt("contador") ?? 0;
    contador = counterAux;
    setState(() {});
  }

  Future<void> eliminarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("nombre");
    nombreGuardado = "Aún no hay un nombre guardado, se eliminó";
    setState(() {});
  }

  Future<void> guardarLista() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("categorias", ["Flutter", "Dart", "Firbase"]);
  }

  Future<void> cargarLista() async {
    final prefs = await SharedPreferences.getInstance();
    final cats = await prefs.getStringList("categorias");
    stringList = cats;
  }

  @override
  void initState() {
    cargarNombre();
    cargarContador();
    cargarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          contador++;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt("contador", contador);

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
                  
                  cargarNombre();
                  guardarLista();
                },
                child: Text("Guardar nombre"),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     cargarNombre();
              //   },
              //   child: Text("Cargar nombre"),
              // ),
              ElevatedButton(
                onPressed: () {
                  eliminarNombre();
                },
                child: Text("Eliminar Nombre"),
              ),
              SizedBox(height: 32),
              Text(
                "Nombre guardado: ${nombreGuardado}",
                style: TextStyle(fontSize: 25),
              ),
              Text(stringList.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
