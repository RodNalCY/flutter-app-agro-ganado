import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:proinnovate_flutter_app/features/animales/viewmodels/destino_view_model.dart';
import 'package:proinnovate_flutter_app/features/animales/viewmodels/tipo_ganado_view_model.dart';
import 'package:proinnovate_flutter_app/features/animales/views/widgets/destino_dropdown.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:proinnovate_flutter_app/features/predios/views/predio_add_page.dart';
import 'package:provider/provider.dart';
import 'package:proinnovate_flutter_app/features/animales/views/widgets/tipo_ganado_dropdown.dart';

class AnimalAddPage extends StatefulWidget {
  final bool statusHeader;
  const AnimalAddPage({Key? key, required this.statusHeader}) : super(key: key);

  @override
  _AnimalAddPageState createState() => _AnimalAddPageState();
}

class _AnimalAddPageState extends State<AnimalAddPage> {
  TextEditingController ctlFechaRegistro = new TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2026),
      locale: const Locale("es", "ES"), // 👈 Forzar español
    );

    if (pickedDate != null) {
      setState(() {
        // 👇 Aquí convertimos DateTime a String
        ctlFechaRegistro.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<TipoGanadoViewModel>(context, listen: false).fetchTipos(),
    );

    Future.microtask(
      () =>
          Provider.of<DestinoViewModel>(context, listen: false).fetchDestinos(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TipoGanadoViewModel>().fetchTipos();
      context.read<DestinoViewModel>().fetchDestinos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.statusHeader
          ? AppBar(
              title: const Text(
                "Agregar Animal",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xFF13161c),
              iconTheme: IconThemeData(color: Colors.white),
            )
          : null,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(15.0),
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
                              hintText: "Ingrese el Código",
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
                    child: Container(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF13161c),
                        ),
                        onPressed: () async {
                          // await buildDialogSync(context);
                          String getValueRadio = "";
                          final result = await buildDialogSync(context);
                          if (result != null) getValueRadio = result;
                          print("getValueRadio: ${getValueRadio}");
                        },
                        icon: const Icon(Icons.sync, size: 25),
                        label: const Text(
                          'Sincronizar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // INPUT TIPO
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
                          child: TipoGanadoDropdown(
                            onChanged: (tipo) {
                              print("Seleccionado: ${tipo?.nombre}");
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
                            Text("Raza", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            // key: dropDownKey,
                            // selectedItem: "Menu",
                            items: (filter, infiniteScrollProps) => [
                              "Holstein",
                              "Brown Swiss",
                              "Jersey",
                              "Ayrshire",
                              "Guernsey",
                              "Simmental",
                              "Charolais",
                              "Hereford",
                              "Angus",
                              "Shorthorn",
                              "Limousin",
                              "Normando",
                              "Brahman",
                              "Gyr",
                              "Nellore",
                              "Santa Gertrudis",
                              "Beefmaster",
                              "Chianina",
                              "Blonde d'Aquitaine",
                              "Brangus",
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
              // INPUT DESTINOS
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Destinos", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DestinoDropdown(
                            onChanged: (destino) {
                              print("Seleccionado: ${destino?.nombre}");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // INPUT FECHA Y RAZA
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Fecha de registro",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        // Container(child: ),
                        Container(
                          child: TextFormField(
                            controller: ctlFechaRegistro,
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
                            Text("Sexo", style: TextStyle(fontSize: 17)),
                            Text(
                              "*",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          child: DropdownSearch<String>(
                            // key: dropDownKey,
                            // selectedItem: "Menu",
                            items: (filter, infiniteScrollProps) => [
                              "Macho",
                              "Hembra",
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
                ],
              ),
              SizedBox(height: 10),
              // TEXT & BUTTON
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Predio", style: TextStyle(fontSize: 28)),
                  Container(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF13161c),
                      ),
                      onPressed: () {
                        showFormBottom(context);
                      },
                      icon: const Icon(Icons.search, size: 25),
                      label: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: const Text(
                          'Buscar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // INFO PRODUCTOR
              buildInfoProductor(context),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nacimiento y cese", style: TextStyle(fontSize: 28)),
                ],
              ),
              // CARD NACIMIENTO Y CESE
              buildCardDateInfo(
                context,
                "04/01/2016",
                "Av. de las Pruebas Mz. A Lt. 13, Arequipa, Arequipa, Arequipa",
                Icons.cake,
              ),
              buildCardDateInfo(
                context,
                "21/01/2025",
                "Av. de las Pruebas Mz. A Lt. 13, Arequipa, Arequipa, Arequipa",
                Icons.spa,
              ),
              SizedBox(height: 10),
              // TEXT & BUTTON
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Imagen", style: TextStyle(fontSize: 28)),
                  Container(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF13161c),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.cloud_upload, size: 25),
                      label: Container(
                        padding: EdgeInsets.only(right: 15),
                        child: const Text(
                          'Subir',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // IMAGE UPLOAD
              Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://a.storyblok.com/f/160385/4bf112f0cd/datos_curiosos.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoProductor(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FlushbarWidget.show(
          context: context,
          message: "Predio seleccionado con exito",
          icon: Icons.check_circle,
          color: Color(0xFF13161c),
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.apartment, size: 45),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "RUC 20123456789",
                    //   style: TextStyle(fontWeight: FontWeight.w300),
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    Text(
                      "EMPRESA GANADERA S.A.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Arequipa, Arequipa, Arequipa | 1240 animales",
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
    );
  }

  Future<String?> buildDialogSync(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String selectedRadioValue = "A";

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                'Sincronizar un dispositivo',
                style: TextStyle(fontSize: 20),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioGroup<String>(
                    groupValue:
                        selectedRadioValue, // State variable holding the selected value
                    onChanged: (String? newValue) {
                      setStateDialog(() {
                        selectedRadioValue =
                            newValue!; // Update the state when a new option is selected
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Radio<String>(value: "A"),
                            Text("Dispositivo A"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(value: "B"),
                            Text("Dispositivo B"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(value: "C"),
                            Text("Dispositivo C"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Text('Seleccionado: $selectedRadioValue'),
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
                    backgroundColor: Color(0xFF13161c),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () =>
                      Navigator.of(context).pop(selectedRadioValue),
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildCardDateInfo(
    BuildContext context,
    String fecha,
    String direccion,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        FlushbarWidget.show(
          context: context,
          message: "Seleccionado: $fecha",
          icon: icon,
          color: Color(0xFF13161c),
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fecha, style: TextStyle(fontSize: 17)),
                    Text(
                      direccion,
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showFormBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: Colors.white,
        // child: RecipeForm(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF13161c),
                    ),
                    onPressed: () {
                      NavigatorWidget.pushWithSlideUp(
                        context,
                        PredioAddPage(statusHeader: true),
                      );
                    },
                    icon: const Icon(Icons.add, size: 25),
                    label: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: const Text(
                        'Agregar nuevo predio',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    onTap: () {
                      // abrir datepicker al tocar
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      hint: Text("Buscar predios..."),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.search, size: 25),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                buildInfoProductor(context),
                buildInfoProductor(context),
                buildInfoProductor(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
