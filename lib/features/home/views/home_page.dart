import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_list_page.dart';
// import 'package:proinnovate_flutter_app/features/medicals/views/medical_page.dart';
import 'package:proinnovate_flutter_app/features/predios/views/predio_list_page.dart';
// import 'package:proinnovate_flutter_app/features/settings/views/setting_page.dart';
import 'package:proinnovate_flutter_app/features/calendar/views/calendar_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    AnimalListPage(),
    PredioListPage(),
    CalendarListPage(),
    // AnimalAddPage(),
    // MedicalPage(),
    // SettingPage(),
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), // 👈 borde redondeado arriba izquierda
          topRight: Radius.circular(15), // 👈 borde redondeado arriba derecha
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.lightBlue,
          elevation: 8,
          onTap: onTapTapped,
          currentIndex: indexTap,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
          // iconSize: 30, // 👈 íconos más grandes
          selectedFontSize: 12, // 👈 texto seleccionado más grande
          unselectedFontSize: 10, // 👈 texto normal más grande
          selectedIconTheme: IconThemeData(size: 27),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Animal"),

            BottomNavigationBarItem(
              icon: Icon(Icons.apartment),
              label: "Predio",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.coronavirus),
            //   label: "Enfermedad",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Calendario",
            ),
          ],
        ),
      ),
    );
  }
}
