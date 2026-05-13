import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_buttons_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_delete_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class CalendarListPage extends StatefulWidget {
  const CalendarListPage({Key? key}) : super(key: key);

  @override
  _CalendarListPageState createState() => _CalendarListPageState();
}

class _CalendarListPageState extends State<CalendarListPage> {
  late ScrollController _scrollController;
  bool _isCalendarVisible = true;

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      // Detecta dirección del scroll
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isCalendarVisible) setState(() => _isCalendarVisible = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isCalendarVisible) setState(() => _isCalendarVisible = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Calendario Animado")),
      body: Column(
        children: [
          // 👇 Calendario con animación
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isCalendarVisible ? 350 : 0, // 👈 Controla el alto
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                child: TableCalendar(
                  headerStyle: HeaderStyle(formatButtonVisible: false),
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2026, 12, 31),
                  focusedDay: focusedDay,
                  locale: 'es_ES',
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blueGrey,
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
                    });
                    // Ejemplo: FlushbarWidget.show(...);
                  },
                  calendarFormat: calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      calendarFormat = format;
                    });
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 👇 Buscador
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: SizedBox(
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    // viewModel.filterAnimals(value);
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 👇 Lista con Scroll que controla la animación
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                return buildCardList(context);
              },
            ),
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
                  Divider(),
                  ActionsButtonsWidget(
                    onEdit: () {
                      FlushbarWidget.show(
                        context: context,
                        message: "Editar consulta (en desarrollo)",
                        icon: Icons.info,
                        color: Colors.blue,
                      );
                    },

                    onDelete: () {
                      ActionsDeleteWidget.show(
                        context: context,
                        deleteLabel: '¿Deseas eliminar la consulta?',
                        onDelete: () {
                          // Acción al eliminar
                        },
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
}
