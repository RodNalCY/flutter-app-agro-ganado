import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_add_page.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_calendario_page.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_familiar_list_page.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_historial_page.dart';

class AnimalHomePage extends StatefulWidget {
  const AnimalHomePage({Key? key}) : super(key: key);

  @override
  _AnimalHomePageState createState() => _AnimalHomePageState();
}

class _AnimalHomePageState extends State<AnimalHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Animal", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlueAccent,
          iconTheme: const IconThemeData(
            color: Colors.white, // 👈 cambia el color del back arrow
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'General'),
              Tab(icon: Icon(Icons.pets), text: 'Familiar'),
              Tab(icon: Icon(Icons.bar_chart_rounded), text: 'Historial'),
              Tab(icon: Icon(Icons.calendar_month_rounded), text: 'Calendario'),
            ],
          ),
        ),
        // body: Center(child: Text("Agregar Predio")),
        body: TabBarView(
          children: [
            AnimalAddPage(statusHeader: false),
            AnimalFamiliarListPage(),
            AnimalHistorialPage(),
            AnimalCalendarioPage(),
          ],
        ),
      ),
    );
  }
}
