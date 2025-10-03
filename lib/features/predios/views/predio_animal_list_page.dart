import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:proinnovate_flutter_app/features/predios/views/predio_animal_transferir_page.dart';

class PredioAnimalListPage extends StatefulWidget {
  const PredioAnimalListPage({Key? key}) : super(key: key);

  @override
  _PredioAnimalListPageState createState() => _PredioAnimalListPageState();
}

class _PredioAnimalListPageState extends State<PredioAnimalListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     NavigatorWidget.pushWithSlideUp(
      //       context,
      //       AnimalAddPage(statusHeader: true),
      //     );
      //   },
      //   backgroundColor: Colors.lightBlue,
      //   child: const Icon(Icons.add, size: 32, color: Colors.white),
      //   shape: const CircleBorder(),
      // ),
      // floatingActionButton: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     FloatingActionButton(
      //       heroTag:
      //           "btn1", // ⚠️ importante: cada botón necesita un heroTag distinto
      //       onPressed: () {
      //         // Acción del botón superior
      //       },
      //       backgroundColor: Colors.blueAccent,
      //       child: const Icon(Icons.search, color: Colors.white),
      //       shape: const CircleBorder(),
      //     ),
      //     const SizedBox(height: 12), // Espacio entre botones
      //     FloatingActionButton(
      //       heroTag: "btn2",
      //       onPressed: () async {
      //         NavigatorWidget.pushWithSlideUp(
      //           context,
      //           AnimalAddPage(statusHeader: true),
      //         );
      //       },
      //       backgroundColor: Colors.lightBlue,
      //       child: const Icon(Icons.add, size: 32, color: Colors.white),
      //       shape: const CircleBorder(),
      //     ),
      //   ],
      // ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(size: 32),
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.repeat),
            label: 'Transferir',
            onTap: () {
              NavigatorWidget.pushWithSlideUp(
                context,
                PredioAnimalTransferirPage(),
              );
            },
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            label: 'Agregar',
            onTap: () async {
              NavigatorWidget.pushWithSlideUp(
                context,
                AnimalAddPage(statusHeader: true),
              );
            },
          ),
        ],
      ),
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
    );
  }

  Widget buildCardList() {
    return Card(
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 190,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://laticiniosholandes.com.br/wp-content/uploads/2023/12/02_CicloDasVacas.png",
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
                    "BOV-181293",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Bovino macho para carne",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Divider(color: Colors.grey),

                  // ROW ENFERMEDAD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.coronavirus, size: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "El animal está sano",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //ROW LOTE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.content_paste, size: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Produjo hace 12 días",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
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
