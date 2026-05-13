import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class ActionsDeleteWidget {
  static void show({
    required BuildContext context,
    required String deleteLabel,
    required VoidCallback onDelete,
  }) {
    showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('Eliminar', style: TextStyle(fontSize: 20)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    deleteLabel,
                    style: TextStyle(fontSize: 14),
                    // textAlign: TextAlign.justify,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black54),
                  onPressed: () => Navigator.of(context).pop(null),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop('Aceptar');
                    FlushbarWidget.show(
                      context: context,
                      message: "Se eliminó el registro con éxito.",
                      icon: Icons.delete,
                      color: Colors.red,
                    );
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
