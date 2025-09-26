import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
                              "Lima",
                              "Huanuco",
                              "Pasco",
                              "Arequipa",
                              "Tumbes",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            popupProps: PopupProps.menu(
                              fit: FlexFit.loose,
                              constraints: BoxConstraints(),
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
                              "Huanuco",
                              "Pasco",
                              "Arequipa",
                              "Tumbes",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            popupProps: PopupProps.menu(
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
                children: [
                  Text("Dirección", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
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
                            Text("Latitud", style: TextStyle(fontSize: 17)),
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
                            decoration: InputDecoration(
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
                  onPressed: () {},
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
