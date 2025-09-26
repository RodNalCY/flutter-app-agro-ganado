import 'package:flutter/material.dart';

class AnimalFamiliarListPage extends StatefulWidget {
  const AnimalFamiliarListPage({Key? key}) : super(key: key);

  @override
  _AnimalFamiliarListPageState createState() => _AnimalFamiliarListPageState();
}

class _AnimalFamiliarListPageState extends State<AnimalFamiliarListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Buscar Familiar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                // return ListTile(title: Text("Animal Familiar $index"));
                return buildCardFamiliar(index: index.toString());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardFamiliar({required String index}) {
    return Card(
      // elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://imagenes.eleconomista.com.mx/files/image_768_768/uploads/2023/03/06/66e45e0535ec3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CENTRO GANADERO S.A. $index",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "PRE1234567 $index",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
