import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/predios/views/predio_propietario_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';

class PredioPropietarioListPage extends StatefulWidget {
  const PredioPropietarioListPage({Key? key}) : super(key: key);

  @override
  _PredioPropietarioListPageState createState() =>
      _PredioPropietarioListPageState();
}

class _PredioPropietarioListPageState extends State<PredioPropietarioListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                child: TextFormField(
                  onTap: () {
                    // abrir datepicker al tocar
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    hint: Text("Buscar propietarios..."),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.search, size: 25),
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildInfoProductor(),
              buildInfoProductor(),
              buildInfoProductor(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigatorWidget.pushWithSlideUp(context, PredioPropietarioAddPage());
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add, size: 32, color: Colors.white),
        shape: const CircleBorder(),
      ),
    );
  }

  Card buildInfoProductor() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            // Icon(Icons.apartment, size: 45),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 40),
                      Column(
                        children: [
                          Text(
                            "PREDIOS GANADEROS PRUEBAS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Bovino hembra para reproducción",
                            style: TextStyle(fontWeight: FontWeight.w300),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
