import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class ProductoGeneralPage extends StatefulWidget {
  final bool isPredio;
  final bool isGanado;
  const ProductoGeneralPage({
    required this.isPredio,
    required this.isGanado,
    Key? key,
  }) : super(key: key);

  @override
  _ProductoGeneralPageState createState() => _ProductoGeneralPageState();
}

class _ProductoGeneralPageState extends State<ProductoGeneralPage> {
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

  List<String> optionsProducto = [
    "Carne",
    "Leche cruda",
    "Cuero",
    "Estiércol",
    "Sebo",
    "Sangre",
    "Huesos",
    "Piel",
    "Ubre",
    "Cola",
    "Pezuñas",
    "Vísceras",
    "Grasa",
    "Cráneo",
    "Lengua",
    "Corazón",
    "Hígado",
    "Riñones",
    "Pulmones",
    "Tripa",
    "Cartílagos",
  ];

  List<String> optionsTipoVenta = [
    "Venta de ganado en pie",
    "Venta de terneros",
    "Venta de vacas de descarte",
    "Venta de leche cruda",
    "Venta de novillos para engorde",
    "Venta por kilo vivo",
    "Venta directa al matadero",
    "Venta a intermediarios",
    "Venta a pie de finca",
  ];

  late TextEditingController ctrlTextPredio;
  late TextEditingController ctrlTextGanado;

  @override
  void initState() {
    print("IS PREDIO ${widget.isPredio}");
    print("IS GANADO ${widget.isGanado}");
    if (widget.isPredio && widget.isGanado) {
      ctrlTextPredio = TextEditingController(text: "PRED_001");
      ctrlTextGanado = TextEditingController(text: "BOV_001");
    } else {
      ctrlTextPredio = TextEditingController(text: "PRED_001");
      ctrlTextGanado = TextEditingController(text: "");
    }

    super.initState();
  }

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
                  Text("Predio", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  controller: ctrlTextPredio,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Ingrese predio",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.apartment, size: 24),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Ganado", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  readOnly: widget.isGanado,
                  controller: ctrlTextGanado,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Ingrese código",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.pets, size: 24),
                  ),
                ),
              ),
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
                      message: "Lectura de RFID (en desarrollo)",
                      icon: Icons.barcode_reader,
                    );
                  },
                  icon: const Icon(Icons.barcode_reader, size: 25),
                  label: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: const Text(
                      'Leer arete electrónico',
                      style: TextStyle(fontSize: 18),
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
                            Text("Producto", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) =>
                                optionsProducto,
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
                            onChanged: (value) {
                              // Asegúrate de que value no sea null
                              print("Índice seleccionado");
                            },
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
                            Text("Lote", style: TextStyle(fontSize: 17)),
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
                              hintText: "Ingrese lote",
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
                              "Tipo de venta",
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
                            items: (filter, infiniteScrollProps) =>
                                optionsTipoVenta,
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                isDense: true,
                                // hintText: "Seleccione",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            dropdownBuilder: (context, selectedItem) {
                              return Text(
                                selectedItem ?? "Seleccione",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              );
                            },

                            popupProps: PopupProps.menu(
                              fit: FlexFit.loose,
                              constraints: BoxConstraints(),
                            ),
                            onChanged: (value) {
                              // Asegúrate de que value no sea null
                              print("Índice seleccionado");
                            },
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
                            Text("Fecha", style: TextStyle(fontSize: 17)),
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
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Text("Observaciones", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Escribe tus observaciones aquí...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
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
                    hintText: "Adjunta un archivo...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.attach_file, size: 24),
                  ),
                ),
              ),
              SizedBox(height: 25),
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
                      message: "Historial guardado con éxito",
                      icon: Icons.save,
                    );
                  },
                  icon: const Icon(Icons.add, size: 25),
                  label: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: const Text(
                      'Guardar Producto',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
