import 'package:flutter/material.dart';

class AnimalCalendarioPage extends StatefulWidget {
  const AnimalCalendarioPage({Key? key}) : super(key: key);

  @override
  _AnimalCalendarioPageState createState() => _AnimalCalendarioPageState();
}

class _AnimalCalendarioPageState extends State<AnimalCalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Calendario Animal")));
  }
}
