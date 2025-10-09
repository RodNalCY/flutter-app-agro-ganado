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
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar predio...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    // viewModel.filterAnimals(value);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return buildInfoProductor(context);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigatorWidget.pushWithSlideUp(context, PredioPropietarioAddPage());
        },
        backgroundColor: Color(0xFF13161c),
        child: Icon(Icons.add, size: 32, color: Colors.white),
        shape: const CircleBorder(),
      ),
    );
  }

  Card buildInfoProductor(BuildContext context) {
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
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CONTENT MEDIA S.A.C",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "RUC 20123456789",
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
