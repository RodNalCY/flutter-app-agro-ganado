import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_list_page.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:proinnovate_flutter_app/features/noticias/views/news_page.dart';
// import 'package:proinnovate_flutter_app/features/medicals/views/medical_page.dart';
import 'package:proinnovate_flutter_app/features/predios/views/predio_list_page.dart';
import 'package:proinnovate_flutter_app/features/settings/views/setting_page.dart';
import 'package:proinnovate_flutter_app/features/calendar/views/calendar_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    AnimalListPage(),
    PredioListPage(),
    CalendarListPage(),
    NewsPage(),
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
      appBar: AppBar(
        // title: Text("Proinnovate", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF13161c),
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF13161c)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Card(
                            shape: const CircleBorder(),
                            elevation: 4,
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "assets/perfil/perfil3.jpg",
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: null, // deshabilita si está ocupado
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(1),
                                child: const Icon(
                                  Icons.verified,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        // 👈 evita que el texto se desborde
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Content Media S.A.C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "contacto@contentmedia.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ExpansionTile(
              leading: const Icon(Icons.more_horiz),
              title: const Text(
                'Administrador',
                style: TextStyle(fontSize: 18),
              ),
              childrenPadding: const EdgeInsets.only(left: 20),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Usuarios"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              // 👇 Esto elimina la línea gris de arriba y abajo
              shape: const Border(),
              collapsedShape: const Border(),
            ),
            ExpansionTile(
              initiallyExpanded: true,
              leading: const Icon(Icons.more_horiz),
              title: const Text('Gestión', style: TextStyle(fontSize: 18)),
              childrenPadding: const EdgeInsets.only(left: 20),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ListTile(
                  leading: const Icon(Icons.pets),
                  title: const Text("Animales"),
                  onTap: () {
                    Navigator.pop(context);
                    onTapTapped(0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.apartment),
                  title: const Text("Predios"),
                  onTap: () {
                    Navigator.pop(context);
                    onTapTapped(1);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: const Text("Calendario"),
                  onTap: () {
                    Navigator.pop(context);
                    onTapTapped(2);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.article),
                  title: const Text("Noticias"),
                  onTap: () {
                    Navigator.pop(context);
                    onTapTapped(3);
                  },
                ),
              ],
              // 👇 Esto elimina la línea gris de arriba y abajo
              shape: const Border(),
              collapsedShape: const Border(),
            ),

            ExpansionTile(
              leading: const Icon(Icons.more_horiz),
              title: const Text('Mi cuenta', style: TextStyle(fontSize: 18)),
              childrenPadding: const EdgeInsets.only(left: 20),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Perfil"),
                  onTap: () {
                    NavigatorWidget.pushWithSlideUp(context, SettingPage());
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Configuración'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Cerrar sesión"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              // 👇 Esto elimina la línea gris de arriba y abajo
              shape: const Border(),
              collapsedShape: const Border(),
            ),

            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Configuración'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     onTapTapped(2);
            //   },
            // ),
          ],
        ),
      ),
      body: widgetsChildren[indexTap],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), // 👈 borde redondeado arriba izquierda
          topRight: Radius.circular(15), // 👈 borde redondeado arriba derecha
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF13161c),
          elevation: 8,
          onTap: onTapTapped,
          currentIndex: indexTap,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 105, 105, 105),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: "Noticias",
            ),
          ],
        ),
      ),
    );
  }
}
