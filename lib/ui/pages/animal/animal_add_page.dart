import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AnimalAddPage extends StatefulWidget {
  const AnimalAddPage({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Añadir de Animal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
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
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
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
                          child: DropdownSearch<String>(
                            // key: dropDownKey,
                            // selectedItem: "Menu",
                            items: (filter, infiniteScrollProps) => [
                              "Bovino",
                              "Porcino",
                              "Ovino",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                // labelText: 'Examples for: ',
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
                                // labelText: 'Examples for: ',
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
                          child: DropdownSearch<String>.multiSelection(
                            items: (filter, infiniteScrollProps) => [
                              "Carne",
                              "Leche",
                              "Reproducción",
                              "Lana",
                            ],
                            popupProps: PopupPropsMultiSelection.menu(
                              // showSearchBox: true,
                              fit: FlexFit.loose,
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  labelText: "Buscar ",
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            onChanged: (values) {
                              print("Seleccionados: $values");
                            },
                          ),
                        ),
                        // Container(
                        //   child: DropdownSearch<String>(
                        //     // key: dropDownKey,
                        //     // selectedItem: "Menu",
                        //     items: (filter, infiniteScrollProps) => [
                        //       "Carne",
                        //       "Leche",
                        //       "Reproducción",
                        //       "Lana",
                        //     ],
                        //     decoratorProps: DropDownDecoratorProps(
                        //       decoration: InputDecoration(
                        //         // labelText: 'Examples for: ',
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(15),
                        //         ),
                        //       ),
                        //     ),
                        //     popupProps: PopupProps.menu(
                        //       fit: FlexFit.loose,
                        //       constraints: BoxConstraints(),
                        //     ),
                        //   ),
                        // ),
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
                              "Raza 1",
                              "Raza 2",
                              "Raza 3",
                              "Raza 4",
                              "Raza 5",
                            ],
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputDecoration(
                                // labelText: 'Examples for: ',
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
                  Text("Productor", style: TextStyle(fontSize: 28)),
                  Container(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {},
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
              buildInfoProductor(),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nacimiento y cese", style: TextStyle(fontSize: 28)),
                ],
              ),
              // CARD NACIMIENTO Y CESE
              buildCardDateInfo(),
              buildCardDateInfo(),

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
                        backgroundColor: Colors.blue,
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

  Card buildInfoProductor() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.account_circle, size: 50),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GUTIERREZ CAZORLA, ANTHONY AGUSTÍN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "DNI 72048328 | Arequipa, Arequipa, Arequipa | 1240 animales",
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
    );
  }

  Card buildCardDateInfo() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cake),
                      Text("21/01/2026", style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  Text(
                    "Av. de las Pruebas Mz. A Lt. 13, Arequipa, Arequipa, Arequipa",
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Peso: 40 kg | Talla: 100 cm",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.edit, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
