import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/models/destino.dart';
import 'package:proinnovate_flutter_app/features/animales/viewmodels/destino_view_model.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DestinoDropdown extends StatelessWidget {
  final void Function(Destino?)? onChanged;
  const DestinoDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DestinoViewModel>(
      builder: (context, vm, child) {
        print("vm ${vm.destinos}");
        if (vm.isLoading) {
          return TextField(
            enabled: false, // deshabilitado mientras carga
            decoration: InputDecoration(
              hintText: "Cargando...",
              suffixIcon: Padding(
                padding: EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        }
        return DropdownSearch<Destino>.multiSelection(
          items: (filter, props) => vm.destinos,
          itemAsString: (destino) => destino.nombre, // cómo mostrar en texto
          compareFn: (a, b) => a.id == b.id, // cómo comparar dos objetos
          onChanged: (destino) {
            print("Seleccionado: ${destino.map((e) => e.nombre).toList()}");
          },
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          popupProps: PopupPropsMultiSelection.menu(
            fit: FlexFit.loose,
            constraints: BoxConstraints(),
          ),
        );
      },
    );
  }
}
