import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_familiar_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          NavigatorWidget.pushWithSlideUp(context, AnimalFamiliarAddPage());
        },
        backgroundColor: Color(0xFF13161c),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
        shape: const CircleBorder(),
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
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://www.clubganadero.com/wp-content/uploads/sites/78/2024/09/image_284597.jpeg",
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
                    "BOV1234567 (Padre) $index",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "Bovino hembra para reproducción $index",
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
