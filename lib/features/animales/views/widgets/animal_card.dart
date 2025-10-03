import 'package:flutter/material.dart';
import '../../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  const AnimalCard({Key? key, required this.animal}) : super(key: key);
  final String imgNotFound =
      "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          Container(
            height: 180,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                animal.imagenUrl ?? imgNotFound,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(imgNotFound, fit: BoxFit.cover);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.codigo,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(animal.destino.descripcion),
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
                        children: [
                          Text(
                            animal.ultimoRegistroMedico?.enfermedad?.nombre ??
                                'El animal está sano',
                          ),
                        ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            // foregroundColor: Colors.white,
                            // backgroundColor: Colors.blue,
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
                            // foregroundColor: Colors.white,
                            // backgroundColor: Colors.red,
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

  String convertDateText(String dateText) {
    var date = DateTime.parse(dateText);
    var day = date.toLocal().day.toString().padLeft(2, '0');
    var month = date.toLocal().month.toString().padLeft(2, '0');
    var year = date.toLocal().year;
    return '$day/$month/$year';
  }
}
