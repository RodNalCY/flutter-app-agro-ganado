import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/productividad/views/producto_general_page.dart';
import 'package:proinnovate_flutter_app/features/productividad/views/producto_historial_page.dart';
import 'package:proinnovate_flutter_app/features/productividad/views/producto_mapa_page.dart';

class ProductoHomePage extends StatefulWidget {
  final bool isPredio;
  final bool isGanado;

  const ProductoHomePage({
    required this.isPredio,
    required this.isGanado,
    Key? key,
  }) : super(key: key);

  @override
  _ProductoHomePageState createState() => _ProductoHomePageState();
}

class _ProductoHomePageState extends State<ProductoHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Producto",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF13161c),
          iconTheme: const IconThemeData(
            color: Colors.white, // 👈 cambia el color del back arrow
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'General'),
              Tab(icon: Icon(Icons.calendar_today), text: 'Historial'),
              Tab(icon: Icon(Icons.south_america), text: 'Mapa'),
            ],
          ),
        ),
        // body: Center(child: Text("Agregar Predio")),
        body: TabBarView(
          children: [
            ProductoGeneralPage(
              isGanado: widget.isGanado,
              isPredio: widget.isPredio,
            ),
            ProductoHistorialPage(),
            ProductoMapaPage(),
          ],
        ),
      ),
    );
  }
}
