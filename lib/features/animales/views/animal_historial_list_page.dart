import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_historial_add_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_buttons_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                      color: Colors.blueGrey, // color del día seleccionado
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
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Color(0xFF13161c),
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(size: 32),

        // buttonSize: Size(65, 65),
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.calendar_month),
            label: 'Generar',
            onTap: () async {
              // FlushbarWidget.show(
              //   context: context,
              //   message: "Se generó el historial con éxito",
              //   icon: Icons.calendar_month,
              // );
              // String getValueRadio = "";
              // final result = await buildDialogSync(context);
              await buildDialogSync(context);

              // Espera 5 segundos y luego cierra el diálogo si sigue activo
              // await Future.delayed(const Duration(seconds: 5));
              // if (context.mounted) {
              //   Navigator.of(context, rootNavigator: true).pop();
              // }
            },
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
                          color: Color(0xFF13161c),
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
                  ActionsButtonsWidget(
                    onEdit: () {
                      FlushbarWidget.show(
                        context: context,
                        message: "Editar Activado ",
                        icon: Icons.info,
                        color: Colors.blue,
                      );
                    },

                    onDelete: () {
                      FlushbarWidget.show(
                        context: context,
                        message: "Eliminar Activado ",
                        icon: Icons.info,
                        color: Colors.red,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> buildDialogSync(BuildContext context) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Cierra automáticamente tras 5 segundos
        Future.delayed(const Duration(seconds: 5), () {
          if (context.mounted) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        });
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // title: const Text(
              //   'Sincronizar un dispositivo',
              //   style: TextStyle(fontSize: 20),
              // ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Generando calendario de vacunación para el animal. Por favor espere...",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Center(
                    child: Stack(
                      children: [
                        LoadingAnimationWidget.threeArchedCircle(
                          color: Color(0xFF13161c),
                          size: 55,
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: null, // deshabilita si está ocupado
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(6),
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0),
                ],
              ),
              // actions: [
              //   TextButton(
              //     style: TextButton.styleFrom(foregroundColor: Colors.black54),
              //     onPressed: () => Navigator.of(context).pop(null),
              //     child: const Text('Cancelar'),
              //   ),
              // ],
            );
          },
        );
      },
    );
  }
}
