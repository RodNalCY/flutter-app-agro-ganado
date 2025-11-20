import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_buttons_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_delete_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import '../../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  const AnimalCard({Key? key, required this.animal}) : super(key: key);
  final String imgNotFound =
      "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png";

  String getDestinoNames() {
    return animal.destino.map((d) => d.nombre).join(' | ');
  }

  String getEnfermedadNames() {
    bool status = animal.ultimoRegistroMedico?.enfermedad!.isEmpty ?? true;
    if (!status) {
      return animal.ultimoRegistroMedico!.enfermedad!
          .map((e) => e.nombre)
          .join(', ');
    }
    return 'El animal está sano';
  }

  @override
  Widget build(BuildContext context) {
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
                animal.imagenUrl ?? imgNotFound,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(imgNotFound, fit: BoxFit.cover);
                },
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
                    animal.codigo,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(getDestinoNames()),
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
                        children: [Text(getEnfermedadNames())],
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
                  ActionsButtonsWidget(
                    onEdit: () {
                      FlushbarWidget.show(
                        context: context,
                        message:
                            "Editar: " + animal.codigo + " (en desarrollo)",
                        icon: Icons.info,
                        color: Colors.blue,
                      );
                    },

                    onDelete: () {
                      ActionsDeleteWidget.show(
                        context: context,
                        deleteLabel:
                            '¿Deseas eliminar el animal ${animal.codigo}?',
                        onDelete: () {
                          // Acción al eliminar
                        },
                      );
                    },
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
