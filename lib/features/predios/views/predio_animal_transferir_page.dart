import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class PredioAnimalTransferirPage extends StatefulWidget {
  const PredioAnimalTransferirPage({Key? key}) : super(key: key);

  @override
  _PredioAnimalTransferirPageState createState() =>
      _PredioAnimalTransferirPageState();
}

class _PredioAnimalTransferirPageState
    extends State<PredioAnimalTransferirPage> {
  TextEditingController ctlFecha = new TextEditingController();
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
          'Transferir Animal',
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
                  Text("Descripcion", style: TextStyle(fontSize: 17)),
                  Text("*", style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
              Container(
                child: TextFormField(
                  maxLines: 4,
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
                children: [
                  Text("Adjuntar Archivo", style: TextStyle(fontSize: 17)),
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
                    prefixIcon: Icon(Icons.attach_file, size: 24),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Animal a transferir", style: TextStyle(fontSize: 24)),
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
