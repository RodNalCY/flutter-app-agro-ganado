import 'package:flutter/material.dart';

class PredioAddPage extends StatefulWidget {
  const PredioAddPage({Key? key}) : super(key: key);

  @override
  _PredioAddPageState createState() => _PredioAddPageState();
}

class _PredioAddPageState extends State<PredioAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Agregar Predio")));
  }
}
