import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/ui/pages/animal/animal_add_page.dart';
import 'package:proinnovate_flutter_app/ui/pages/animal/animal_list_page.dart';
import 'package:proinnovate_flutter_app/ui/pages/predio/predio_page.dart';
import 'package:proinnovate_flutter_app/ui/pages/medical/medical_page.dart';
import 'package:proinnovate_flutter_app/ui/pages/setting/setting_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    AnimalListPage(), // index 0
    PredioPage(), // index 1
    AnimalAddPage(), // index 2 (lo abre el FAB)
    MedicalPage(), // index 3
    SettingPage(), // index 4
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            indexTap = 2; // 👈 muestra AnimalAddPage dentro del body
          });
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
          size: 32,
          color: indexTap == 2 ? Colors.white : Colors.blueGrey,
        ),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.lightBlue,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: (indexTap == 2)
              ? 0
              : (indexTap > 2 ? indexTap - 1 : indexTap),

          selectedItemColor: indexTap == 2 ? Colors.blueGrey : Colors.white,
          unselectedItemColor:  Colors.blueGrey,
          onTap: (index) {
            print("POSITION ${index}");
            if (index == 0) {
              onTapTapped(0); // Listar
            } else if (index == 1) {
              onTapTapped(1); // Predio
            } else if (index == 2) {
              onTapTapped(3); // Médico
            } else if (index == 3) {
              onTapTapped(4); // Setting
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pets, size: 22),
              label: "Animal",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apartment, size: 22),
              label: "Predio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coronavirus, size: 22),
              label: "Enfermedad",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 22),
              label: "Setting",
            ),
          ],
        ),
      ),
    );
  }
}
