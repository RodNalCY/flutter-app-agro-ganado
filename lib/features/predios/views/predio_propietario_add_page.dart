import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class PredioPropietarioAddPage extends StatefulWidget {
  const PredioPropietarioAddPage({Key? key}) : super(key: key);

  @override
  _PredioPropietarioAddPageState createState() =>
      _PredioPropietarioAddPageState();
}

class _PredioPropietarioAddPageState extends State<PredioPropietarioAddPage> {
  bool isChecked = false;
  TextEditingController ctlFecha = new TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2026),
      locale: const Locale("es", "ES"), // Forzar español
    );

    if (pickedDate != null) {
      setState(() {
        // 👇 Aquí convertimos DateTime a String
        ctlFecha.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agregar Propietario",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
        iconTheme: IconThemeData(color: Colors.white),
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
                            Text(
                              "Tipo de documento",
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
                              "DNI",
                              "Cedula",
                              "Pasaporte",
                              "Otros",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                hintText: "Seleccione",
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
                            Text(
                              "N° Documento",
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
                              hintText: "Ingrese documento",
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
                              "Apellido paterno",
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
                              hintText: "Ingrese apellido paterno",
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
                            Text(
                              "Apellido materno",
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
                              hintText: "Ingrese apellido materno",
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
                children: [
                  Text("Nombre", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ingrese nombre(s)",
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
                            Text(
                              "Fecha de nacimiento",
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
                            controller: ctlFecha,
                            onTap: () {
                              selectDate(context); // abrir datepicker al tocar
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "--/--/----",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: Icon(Icons.calendar_month, size: 25),
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
                            Text("Role", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) => [
                              "Propietario",
                              "Familiar",
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const Text('Usar la dirección del predio')],
                      ),
                    ],
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
                              "Lima",
                              "Huanuco",
                              "Pasco",
                              "Arequipa",
                              "Tumbes",
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
                            Text(
                              "Centro poblado",
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
                              hintText: "Ingrese poblado",
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
                children: [
                  Text("Dirección del predio", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Ingrese la dirección del predio",
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
                              hintText: "Ingrese latitud",
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
                              hintText: "Ingrese longitud",
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
                      'Guardar propietario',
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
