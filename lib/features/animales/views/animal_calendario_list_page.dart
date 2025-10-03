import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AnimalCalendarioListPage extends StatefulWidget {
  const AnimalCalendarioListPage({Key? key}) : super(key: key);

  @override
  _AnimalCalendarioListPageState createState() =>
      _AnimalCalendarioListPageState();
}

class _AnimalCalendarioListPageState extends State<AnimalCalendarioListPage> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  CalendarFormat calendarFormat =
      CalendarFormat.month; // 👈 formato por defecto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onTap: () {
              // NavigatorWidget.pushWithSlideUp(
              //   context,
              //   PredioAnimalTransferirPage(),
              // );
            },
          ),
        ],
      ),
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

              buildCardList(context),
              buildCardList(context),
              buildCardList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardList(BuildContext context) {
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
                            FlushbarWidget.show(
                              context: context,
                              message: "Editar consulta médica",
                              icon: Icons.edit,
                              color: Colors.blue,
                            );
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
                            FlushbarWidget.show(
                              context: context,
                              message: "Eliminar consulta médica",
                              icon: Icons.delete,
                              color: Colors.red,
                            );
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
}
