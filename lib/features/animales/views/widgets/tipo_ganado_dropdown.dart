import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/models/animal.dart';
import 'package:proinnovate_flutter_app/features/animales/viewmodels/tipo_ganado_view_model.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class TipoGanadoDropdown extends StatelessWidget {
  final void Function(TipoGanado?)? onChanged;

  const TipoGanadoDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TipoGanadoViewModel>(
      builder: (context, vm, child) {
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

        return DropdownSearch<TipoGanado>(
          items: (filter, props) => vm.tipos,
          itemAsString: (tipo) => tipo.nombre, // 👈 cómo mostrar en texto
          compareFn: (a, b) => a.id == b.id, // 👈 cómo comparar dos objetos
          onChanged: (tipo) {
            print("Seleccionado: ${tipo?.nombre}");
          },
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              isDense: true,
              hintText: "Seleccione",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            constraints: BoxConstraints(),
          ),
        );
      },
    );
  }
}
