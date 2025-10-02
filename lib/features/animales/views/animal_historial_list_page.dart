import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_historial_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';

class AnimalHistorialListPage extends StatefulWidget {
  const AnimalHistorialListPage({Key? key}) : super(key: key);

  @override
  _AnimalHistorialListPageState createState() =>
      _AnimalHistorialListPageState();
}

class _AnimalHistorialListPageState extends State<AnimalHistorialListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              buildCardList(),
              buildCardList(),
              buildCardList(),
              buildCardList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          NavigatorWidget.pushWithSlideUp(context, AnimalHistorialAddPage());
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add, size: 32, color: Colors.white),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget buildCardList() {
    return Card(
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://img.freepik.com/fotos-premium/cuidado-vacas-veterinarios-mano-sostiene-jeringa-medicamentos-tratamiento-redes-sociales-post-size_896558-62360.jpg",
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
                    "Vacuna aplicada",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "10/09/2025",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Divider(color: Colors.grey),
                  // ROW REGISTRO HAPPY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Tipo:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Vacuna para ántrax",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  // ROW ENFERMEDAD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lote:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("ABC1234", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  //ROW LOTE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Marca:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Pfizer", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: LinearBorder(),
                            foregroundColor: Colors.blue,
                          ),

                          onPressed: () {
                            // snackbarEditar();
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text(
                            'Editar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: LinearBorder(),
                            foregroundColor: Colors.red,
                          ),
                          onPressed: () {
                            // snackbarEliminar();
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text(
                            'Eliminar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
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
