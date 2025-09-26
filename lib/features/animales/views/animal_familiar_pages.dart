import 'package:flutter/material.dart';

class AnimalFamiliarPage extends StatefulWidget {
  const AnimalFamiliarPage({Key? key}) : super(key: key);

  @override
  _AnimalFamiliarPageState createState() => _AnimalFamiliarPageState();
}

class _AnimalFamiliarPageState extends State<AnimalFamiliarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Familiar Animal")));
  }
}
