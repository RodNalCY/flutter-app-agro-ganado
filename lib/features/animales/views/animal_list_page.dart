import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_add_page.dart';

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({Key? key}) : super(key: key);

  @override
  _AnimalListPageState createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Animales",
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
                  AnimalAddPage(),
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
            height: 240,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://laticiniosholandes.com.br/wp-content/uploads/2023/12/02_CicloDasVacas.png",
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
                    "BOV-181293",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Bovino macho para carne",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Divider(color: Colors.grey),
                  // ROW REGISTRO HAPPY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.cake, size: 28),
                      Text("12/03/2022", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  // ROW ENFERMEDAD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.coronavirus, size: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Diarrea viral bovina (DVB)",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "06/07/2025 - 08/09/2025",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //ROW LOTE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.content_paste, size: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lote de queso QSO-134285",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "07/08/2025",
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
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          snackbarEditar();
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
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          snackbarEliminar();
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
