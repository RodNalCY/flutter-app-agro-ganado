import 'package:flutter/material.dart';
import 'predio_add_page.dart';
import 'predio_animal_page.dart';
import 'predio_propietario_page.dart';

class PredioHomePage extends StatefulWidget {
  const PredioHomePage({Key? key}) : super(key: key);

  @override
  _PredioHomePageState createState() => _PredioHomePageState();
}

class _PredioHomePageState extends State<PredioHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Añadir de Predio",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.lightBlueAccent,
          iconTheme: const IconThemeData(
            color: Colors.white, // 👈 cambia el color del back arrow
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.add_home_work), text: 'General'),
              Tab(icon: Icon(Icons.pets), text: 'Animales'),
              Tab(icon: Icon(Icons.person), text: 'Propietarios'),
            ],
          ),
        ),
        // body: Center(child: Text("Agregar Predio")),
        body: TabBarView(
          children: [
            PredioAddPage(),
            PredioAnimalPage(),
            PredioPropietarioPage(),
          ],
        ),
      ),
    );
  }
}
