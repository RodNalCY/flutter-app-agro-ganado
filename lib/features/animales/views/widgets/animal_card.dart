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
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.codigo,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(animal.descripcion),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.cake, size: 20),
                      SizedBox(width: 5),
                      Text(animal.fechaNacimiento),
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
