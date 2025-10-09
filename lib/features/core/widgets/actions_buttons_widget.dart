import 'package:flutter/material.dart';

class ActionsButtonsWidget extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final String? editLabel;
  final String? deleteLabel;

  const ActionsButtonsWidget({
    Key? key,
    this.onEdit,
    this.onDelete,
    this.editLabel,
    this.deleteLabel,
  }) : super(key: key);

  final double fntSize = 15;
  final double brdRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Botón Editar
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(brdRadius),
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
            label: Text(
              editLabel ?? 'Editar',
              style: TextStyle(fontSize: fntSize),
            ),
          ),
        ),
        const SizedBox(width: 5),
        // Botón Eliminar
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(brdRadius),
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
            ),
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
            label: Text(
              deleteLabel ?? 'Eliminar',
              style: TextStyle(fontSize: fntSize),
            ),
          ),
        ),
      ],
    );
  }
}
