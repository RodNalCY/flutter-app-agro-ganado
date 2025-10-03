import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class AnimalHistorialAddPage extends StatefulWidget {
  const AnimalHistorialAddPage({Key? key}) : super(key: key);

  @override
  _AnimalHistorialAddPageState createState() => _AnimalHistorialAddPageState();
}

class _AnimalHistorialAddPageState extends State<AnimalHistorialAddPage> {
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

  bool isChecked = false;

  // Lista base
  List<String> optionsTipo = [
    "Consulta Médica",
    "Transferencia",
    "Vacunación",
    "Producción",
  ];
  // Widget? selectedWidgetTipo;

  // void onItemSelectedTipo(int index, BuildContext context) {
  //   Widget selected;

  //   switch (index) {
  //     case 0:
  //       selected = buildCheckboxEnfermedad();
  //       break;
  //     case 1:
  //       selected = buildSelectPredio(context);
  //       break;
  //     case 2:
  //       selected = buildInputTipoVacuna();
  //       break;
  //     case 3:
  //       selected = buildSelectDestino(context);
  //       break;
  //     default:
  //       selected = Container(); // opcional por seguridad
  //   }

  //   setState(() {
  //     selectedWidgetTipo = selected;
  //   });
  // }

  int? selectedTipoIndex;
  void onItemSelectedTipo(int index, BuildContext context) {
    setState(() {
      selectedTipoIndex = index;
    });
  }

  Widget buildSelectedTipo(BuildContext context) {
    switch (selectedTipoIndex) {
      case 0:
        return buildCheckboxEnfermedad();
      case 1:
        return buildSelectPredio(context);
      case 2:
        return buildInputTipoVacuna();
      case 3:
        return buildSelectDestino(context);
      default:
        return Container(); // valor por defecto
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar historial de animal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
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
                            Text("Tipo", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            items: (filter, infiniteScrollProps) => optionsTipo,
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
                              int selectedIndexTipo = optionsTipo.indexOf(
                                value!,
                              ); // Asegúrate de que value no sea null
                              print(
                                "Índice seleccionado: $value - $selectedIndexTipo",
                              );
                              onItemSelectedTipo(selectedIndexTipo, context);
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
              SizedBox(height: 10),
              // Column(
              //   children: [
              //     if (selectedWidgetTipo != null) selectedWidgetTipo!,
              //     buildCheckboxEnfermedad(),
              //   ],
              // ),
              // Aquí se muestra el widget seleccionado
              // if (selectedWidgetTipo != null) selectedWidgetTipo!,
              // SizedBox(height: 10),
              // buildCheckboxEnfermedad(),
              // SizedBox(height: 10),
              // buildSelectPredio(context),
              // SizedBox(height: 10),
              // buildSelectDestino(context),
              // buildInputTipoVacuna(),
              buildSelectedTipo(context),
              SizedBox(height: 10),
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
                      message: "Historial guardado con éxito",
                      icon: Icons.save,
                      color: Colors.blue,
                    );
                  },
                  icon: const Icon(Icons.add, size: 25),
                  label: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: const Text(
                      'Guardar Historial',
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

  Widget buildCheckboxEnfermedad() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Enfermedades", style: TextStyle(fontSize: 24)),
            Container(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // showFormBottom(context);
                },
                icon: const Icon(Icons.add, size: 25),
                label: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: const Text('Nuevo', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
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
              hint: Text("Buscar..."),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(Icons.search, size: 25),
            ),
          ),
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
                  children: [
                    const Text('Diarrea viral bovina (DVB)'),
                    const Text('ABC345'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSelectPredio(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Nuevo Predio", style: TextStyle(fontSize: 24))],
        ),
        SizedBox(height: 10),
        Container(
          child: TextFormField(
            onTap: () {
              // abrir datepicker al tocar
            },
            decoration: InputDecoration(
              isDense: true,
              hint: Text("Buscar..."),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(Icons.search, size: 25),
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            FlushbarWidget.show(
              context: context,
              message: "Predio Seleccionado",
              icon: Icons.info_outline,
              color: Colors.blue,
            );
          },
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  // Icon(Icons.apartment, size: 45),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PREDIO 1",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "PRE1234567",
                          style: TextStyle(fontWeight: FontWeight.w300),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSelectDestino(BuildContext context) {
    return Column(
      children: [
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
                      items: (filter, infiniteScrollProps) => [
                        "Carne de res",
                        "Leche",
                        "Queso",
                        "Mantequilla",
                        "Yogur",
                        "Crema de leche",
                        "Helado",
                        "Cuero",
                        "Gelatina",
                        "Grasa bovina (sebo)",
                        "Harina de hueso",
                        "Sueros lácteos",
                        "Leche en polvo",
                        "Carne seca (charqui)",
                        "Vísceras comestibles",
                        "Colágeno bovino",
                      ],
                      dropdownBuilder: (context, selectedItem) {
                        return Text(
                          selectedItem ?? "Seleccione",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          isDense: true,
                          // isCollapsed: true,
                          // hintText: "Seleccione",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      popupProps: PopupProps.modalBottomSheet(
                        modalBottomSheetProps: ModalBottomSheetProps(
                          barrierDismissible: true, //se cierra al tocar fuera
                          useSafeArea: true,
                          showDragHandle: true,
                        ),

                        fit: FlexFit.loose,
                        constraints: BoxConstraints(
                          maxHeight:
                              MediaQuery.of(context).size.height *
                              0.4, // máximo la mitad de la pantalla
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
                        hintText: "Ingrese el lote",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Destino", style: TextStyle(fontSize: 24)),
            Container(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // showFormBottom(context);
                },
                icon: const Icon(Icons.add, size: 25),
                label: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: const Text('Nuevo', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
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
              hint: Text("Buscar..."),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(Icons.search, size: 25),
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            FlushbarWidget.show(
              context: context,
              message: "Predio Seleccionado",
              icon: Icons.info_outline,
              color: Colors.blue,
            );
          },
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  // Icon(Icons.apartment, size: 45),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GLORIA S.A.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "RUC 20123456789",
                          style: TextStyle(fontWeight: FontWeight.w300),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInputTipoVacuna() {
    return Column(
      children: [
        Row(
          children: [
            Text("Vacuna", style: TextStyle(fontSize: 17)),
            Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
          ],
        ),
        Container(
          child: DropdownSearch<String>(
            items: (filter, infiniteScrollProps) => [
              "Vacuna triple para muertes súbitas",
              "Vacuna para ántrax",
              "Vacuna de brucelosis bovina",
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
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Marca", style: TextStyle(fontSize: 17)),
                      Text(
                        "*",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ],
                  ),
                  Container(
                    child: DropdownSearch<String>(
                      items: (filter, infiniteScrollProps) => [
                        "Pfizer",
                        "Moderna",
                        "AstraZeneca",
                        "Janssen",
                        "Vaxzevria",
                        "Sinovac",
                        "Novavax",
                        "Coronavac",
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
                        hintText: "Ingrese el lote",
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
      ],
    );
  }
}
