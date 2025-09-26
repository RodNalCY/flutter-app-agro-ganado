import 'package:flutter/material.dart';

class PredioAnimalPage extends StatefulWidget {
  const PredioAnimalPage({Key? key}) : super(key: key);

  @override
  _PredioAnimalPageState createState() => _PredioAnimalPageState();
}

class _PredioAnimalPageState extends State<PredioAnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Animales Predio")));
  }
}
