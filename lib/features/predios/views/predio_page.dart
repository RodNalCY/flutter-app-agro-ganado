import 'package:flutter/material.dart';

class PredioPage extends StatefulWidget {
  const PredioPage({Key? key}) : super(key: key);

  @override
  _PredioPageState createState() => _PredioPageState();
}

class _PredioPageState extends State<PredioPage> {
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.apartment, size: 60),
            Center(child: Text("Vista Predio")),
          ],
        ),
      ),
    );
  }
}
