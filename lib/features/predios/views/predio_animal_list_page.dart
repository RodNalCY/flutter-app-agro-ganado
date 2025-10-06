import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
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
        backgroundColor: Color(0xFF13161c),
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
        children: [
          Container(
            height: 160,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1668446123344-d7945fb07eaa?fm=jpg",
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BOV-181293",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text("Bovino macho para carne"),
                  Divider(),
                  // Row(
                  //   children: [
                  //     Icon(Icons.cake, size: 20),
                  //     SizedBox(width: 5),
                  //     Text(convertDateText(animal.fechaNacimiento)),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Icon(Icons.coronavirus, size: 20),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('El animal está sano')],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.content_paste, size: 20),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Produjo hace 12 días'),
                          // Text("09/10/2025"),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                          ),

                          onPressed: () {
                            FlushbarWidget.show(
                              context: context,
                              message: "Editar Activado",
                              icon: Icons.info,
                              color: Colors.blue,
                            );
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text(
                            'Editar',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                          ),
                          onPressed: () {
                            FlushbarWidget.show(
                              context: context,
                              message: "Eliminar Activado",
                              icon: Icons.info,
                              color: Colors.red,
                            );
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text(
                            'Eliminar',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
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
