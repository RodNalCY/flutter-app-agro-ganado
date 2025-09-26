import 'package:flutter/material.dart';
import 'predio_home_page.dart';

class PredioListPage extends StatefulWidget {
  const PredioListPage({Key? key}) : super(key: key);

  @override
  _PredioListPageState createState() => _PredioListPageState();
}

class _PredioListPageState extends State<PredioListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Predios",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              buildCardList(),
              buildCardList(),
              buildCardList(),
              buildCardList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  PredioHomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0); // 👈 entra desde abajo
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(
                      begin: begin,
                      end: end,
                    ).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: FadeTransition(
                        // 👈 combina fade + slide
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
            ),
          );
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add, size: 32, color: Colors.white),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget buildCardList() {
    return Card(
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://imagenes.eleconomista.com.mx/files/image_768_768/uploads/2023/03/06/66e45e0535ec3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CENTRO GANADERO S.A.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "PRE1234567",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Divider(color: Colors.grey),
                  // ROW REGISTRO HAPPY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.pets, size: 28),
                      Text("1240 animales", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  // ROW ENFERMEDAD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.location_on, size: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CALLE DE LAS PRUEBAS...",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Arequipa, Arequipa, Arequipa",
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

  void snackbarEliminar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Registro Eliminado !!!"),
        duration: Duration(seconds: 2), // cuánto tiempo se muestra
        behavior: SnackBarBehavior.floating, // flotante o fijo abajo
      ),
    );
  }

  void snackbarEditar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Registro Editado !!!"),
        duration: Duration(seconds: 2), // cuánto tiempo se muestra
        behavior: SnackBarBehavior.floating, // flotante o fijo abajo
      ),
    );
  }
}
