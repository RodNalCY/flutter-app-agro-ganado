import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_historial_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class AnimalHistorialListPage extends StatefulWidget {
  const AnimalHistorialListPage({Key? key}) : super(key: key);

  @override
  _AnimalHistorialListPageState createState() =>
      _AnimalHistorialListPageState();
}

class _AnimalHistorialListPageState extends State<AnimalHistorialListPage> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month; // formato por defecto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Container(
      //     child: Column(
      //       children: <Widget>[
      //         buildCardList(),
      //         buildCardList(),
      //         buildCardList(),
      //         buildCardList(),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     NavigatorWidget.pushWithSlideUp(context, AnimalHistorialAddPage());
      //   },
      //   backgroundColor: Colors.lightBlue,
      //   child: const Icon(Icons.add, size: 32, color: Colors.white),
      //   shape: const CircleBorder(),
      // ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: TableCalendar(
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2026, 12, 31),
                  focusedDay: focusedDay,
                  locale: 'es_ES', // 👈 idioma español
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  // headerStyle: const HeaderStyle(
                  //   formatButtonVisible: false, // 👈 oculta el botón "2 weeks"
                  // ),
                  // 👇 Aquí personalizamos colores
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.black, // color del día de hoy
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.lightBlue, // color del día seleccionado
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    todayTextStyle: const TextStyle(color: Colors.white),
                  ),
                  onDaySelected: (selected, focused) {
                    setState(() {
                      selectedDay = selected;
                      focusedDay = focused;
                    }); // 👉 Mostrar alerta
                    FlushbarWidget.show(
                      context: context,
                      message:
                          "${selected.day}/${selected.month}/${selected.year}",
                      icon: Icons.calendar_month,
                      color: Colors.blue,
                    );
                  },
                  // 👇 ESTA ES LA PARTE QUE TE FALTABA
                  calendarFormat: calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      calendarFormat = format;
                    });
                  },
                ),
              ),

              buildCardList(),
              buildCardList(),
              buildCardList(),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,

        // buttonSize: Size(65, 65),
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.calendar_month),
            label: 'Generar',
            onTap: () {},
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            label: 'Agregar',
            onTap: () {
              NavigatorWidget.pushWithSlideUp(
                context,
                AnimalHistorialAddPage(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildCardList() {
    return Card(
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Icon(
                          Icons.vaccines,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Consulta médica",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "2 enfermedades detectadas",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: LinearBorder(),
                            foregroundColor: Colors.blue,
                          ),

                          onPressed: () {
                            // snackbarEditar();
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text(
                            'Editar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: LinearBorder(),
                            foregroundColor: Colors.red,
                          ),
                          onPressed: () {
                            // snackbarEliminar();
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text(
                            'Eliminar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget buildCardList() {
  //   return Card(
  //     elevation: 4,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: <Widget>[
  //         Container(
  //           height: 200,
  //           width: 120,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: Image.network(
  //               "https://img.freepik.com/fotos-premium/cuidado-vacas-veterinarios-mano-sostiene-jeringa-medicamentos-tratamiento-redes-sociales-post-size_896558-62360.jpg",
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(
  //                   "Vacuna aplicada",
  //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //                 ),
  //                 Text(
  //                   "10/09/2025",
  //                   style: TextStyle(fontWeight: FontWeight.w300),
  //                 ),
  //                 Divider(color: Colors.grey),
  //                 // ROW REGISTRO HAPPY
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: <Widget>[
  //                     Text(
  //                       "Tipo:",
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     Text(
  //                       "Vacuna para ántrax",
  //                       style: TextStyle(fontSize: 16),
  //                     ),
  //                   ],
  //                 ),
  //                 // ROW ENFERMEDAD
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       "Lote:",
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     Text("ABC1234", style: TextStyle(fontSize: 16)),
  //                   ],
  //                 ),
  //                 //ROW LOTE
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       "Marca:",
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     Text("Pfizer", style: TextStyle(fontSize: 16)),
  //                   ],
  //                 ),
  //                 Divider(color: Colors.grey),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Expanded(
  //                       child: TextButton.icon(
  //                         style: TextButton.styleFrom(
  //                           shape: LinearBorder(),
  //                           foregroundColor: Colors.blue,
  //                         ),

  //                         onPressed: () {
  //                           // snackbarEditar();
  //                         },
  //                         icon: const Icon(Icons.edit),
  //                         label: const Text(
  //                           'Editar',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 17,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: TextButton.icon(
  //                         style: TextButton.styleFrom(
  //                           shape: LinearBorder(),
  //                           foregroundColor: Colors.red,
  //                         ),
  //                         onPressed: () {
  //                           // snackbarEliminar();
  //                         },
  //                         icon: const Icon(Icons.delete),
  //                         label: const Text(
  //                           'Eliminar',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 17,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
