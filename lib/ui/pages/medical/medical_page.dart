import 'package:flutter/material.dart';

class MedicalPage extends StatefulWidget {
  const MedicalPage({Key? key}) : super(key: key);

  @override
  _MedicalPageState createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Predio",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(child: Center(child: Text("Vista medical"))),
    );
  }
}
