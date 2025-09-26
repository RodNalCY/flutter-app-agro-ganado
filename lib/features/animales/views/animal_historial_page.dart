import 'package:flutter/material.dart';

class AnimalHistorialPage extends StatefulWidget {
  const AnimalHistorialPage({Key? key}) : super(key: key);

  @override
  _AnimalHistorialPageState createState() => _AnimalHistorialPageState();
}

class _AnimalHistorialPageState extends State<AnimalHistorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Historial Animal")));
  }
}
