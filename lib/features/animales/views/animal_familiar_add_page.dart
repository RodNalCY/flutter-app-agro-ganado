import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class AnimalFamiliarAddPage extends StatefulWidget {
  const AnimalFamiliarAddPage({Key? key}) : super(key: key);

  @override
  _AnimalFamiliarAddPageState createState() => _AnimalFamiliarAddPageState();
}

class _AnimalFamiliarAddPageState extends State<AnimalFamiliarAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar familiar de animal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF13161c),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Parentezco", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) => [
                              "Toro",
                              "Vaca",
                              "Novillo",
                              "Vaquilla",
                              "Ternero",
                              "Ternera",
                              "Becerro",
                              "Becerra",
                              "Semental",
                              "Madre",
                              "Padre",
                              "Hijo",
                              "Hija",
                              "Hermano",
                              "Hermana",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Seleccione",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            popupProps: PopupProps.modalBottomSheet(
                              modalBottomSheetProps: ModalBottomSheetProps(
                                barrierDismissible:
                                    true, //se cierra al tocar fuera
                                useSafeArea: true,
                                showDragHandle: true,
                              ),
                              fit: FlexFit.loose,
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height *
                                    0.5, // máximo la mitad de la pantalla
                              ),
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: "Buscar...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Adjuntar Archivo", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    hint: Text("Adjunte el archivo"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.attach_file, size: 24),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Seleccione el Animal", style: TextStyle(fontSize: 24)),
                ],
              ),
              SizedBox(height: 10),
              Container(
                child: TextFormField(
                  onTap: () {
                    // abrir datepicker al tocar
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    hint: Text("Buscar animales..."),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.search, size: 25),
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildInfoProductor(),
              buildInfoProductor(),
              buildInfoProductor(),
              SizedBox(height: 10),

              Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF13161c),
                  ),
                  onPressed: () {
                    FlushbarWidget.show(
                      context: context,
                      message: "Se guardó el familiar con éxito",
                      icon: Icons.save,
                      color: Colors.blue,
                    );
                  },
                  icon: const Icon(Icons.add, size: 25),
                  label: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: const Text(
                      'Guardar Familiar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Card buildInfoProductor() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            // Icon(Icons.apartment, size: 45),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BOV-181293",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Bovino hembra para reproducción",
                    style: TextStyle(fontWeight: FontWeight.w300),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(Icons.apartment, size: 20),
                      Text(
                        "PREDIOS GANADEROS PRUEBAS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
