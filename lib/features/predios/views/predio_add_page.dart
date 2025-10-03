import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class PredioAddPage extends StatefulWidget {
  const PredioAddPage({Key? key}) : super(key: key);

  @override
  _PredioAddPageState createState() => _PredioAddPageState();
}

class _PredioAddPageState extends State<PredioAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text("Nombre", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ingrese el nombre",
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Código", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Ingrese el código",
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Área (ha)", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Ingrese el área",
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Tipos de ganado",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>.multiSelection(
                            items: (filter, infiniteScrollProps) => [
                              "Bovino",
                              "Porcino",
                              "Ovino",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Seleccione los tipos",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            popupProps: PopupPropsMultiSelection.menu(
                              fit: FlexFit.loose,
                              constraints: BoxConstraints(),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Productos a extraer",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>.multiSelection(
                            items: (filter, infiniteScrollProps) => [
                              "Carne",
                              "Leche",
                              "Lana",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Seleccione los productos",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            popupProps: PopupPropsMultiSelection.menu(
                              fit: FlexFit.loose,
                              constraints: BoxConstraints(),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Departamento",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) => [
                              "Amazonas",
                              "Áncash",
                              "Apurímac",
                              "Arequipa",
                              "Ayacucho",
                              "Cajamarca",
                              "Callao",
                              "Cusco",
                              "Huancavelica",
                              "Huánuco",
                              "Ica",
                              "Junín",
                              "La Libertad",
                              "Lambayeque",
                              "Lima",
                              "Loreto",
                              "Madre de Dios",
                              "Moquegua",
                              "Pasco",
                              "Piura",
                              "Puno",
                              "San Martín",
                              "Tacna",
                              "Tumbes",
                              "Ucayali",
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
                            popupProps: PopupProps.bottomSheet(
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
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Provincia", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) => [
                              "Lima",
                              "Barranca",
                              "Cajatambo",
                              "Canta",
                              "Cañete",
                              "Huaral",
                              "Huarochirí",
                              "Huaura",
                              "Oyón",
                              "Yauyos",
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
                            popupProps: PopupProps.bottomSheet(
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Distrito", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) => [
                              "Ancón",
                              "Ate",
                              "Barranco",
                              "Breña",
                              "Carabayllo",
                              "Chaclacayo",
                              "Chorrillos",
                              "Cieneguilla",
                              "Comas",
                              "El Agustino",
                              "Independencia",
                              "Jesús María",
                              "La Molina",
                              "La Victoria",
                              "Lince",
                              "Los Olivos",
                              "Lurigancho",
                              "Lurín",
                              "Magdalena del Mar",
                              "Miraflores",
                              "Pachacámac",
                              "Pucusana",
                              "Pueblo Libre",
                              "Puente Piedra",
                              "Punta Hermosa",
                              "Punta Negra",
                              "Rímac",
                              "San Bartolo",
                              "San Borja",
                              "San Isidro",
                              "San Juan de Lurigancho",
                              "San Juan de Miraflores",
                              "San Luis",
                              "San Martín de Porres",
                              "San Miguel",
                              "Santa Anita",
                              "Santa María del Mar",
                              "Santa Rosa",
                              "Santiago de Surco",
                              "Surquillo",
                              "Villa El Salvador",
                              "Villa María del Triunfo",
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
                            popupProps: PopupProps.bottomSheet(
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
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Centro Poblado",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Ingrese centro poblado",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
                  Text("Dirección del predio", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Ingrese dirección del predio",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Latitud", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "latitud",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Longitud", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "longitud",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/map-with-destination-location-point-city-map-with-street-river-gps-map-navigator-concept_34645-1078.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    FlushbarWidget.show(
                      context: context,
                      message: "Predio guardado con éxito",
                      icon: Icons.save,
                      color: Colors.blue,
                    );
                  },
                  icon: const Icon(Icons.add, size: 25),
                  label: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: const Text(
                      'Guardar predio',
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
}
