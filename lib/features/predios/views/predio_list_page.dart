import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_buttons_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_delete_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
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
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar predio...",
                    prefixIcon: Icon(Icons.search),
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return buildCardList(context);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigatorWidget.pushWithSlideUp(context, PredioHomePage());
        },
        backgroundColor: Color(0xFF13161c),
        child: Icon(Icons.add, size: 32, color: Colors.white),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget buildCardList(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://imagenes.eleconomista.com.mx/files/image_768_768/uploads/2023/03/06/66e45e0535ec3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
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
                  Divider(),
                  // ROW REGISTRO HAPPY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.pets, size: 20),
                      Text("1240 animales", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  // ROW ENFERMEDAD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.location_on, size: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Arequipa, Arequipa, Arequipa",
                            // style: TextStyle(fontWeight: FontWeight.w300),
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
                        message: "Editar predio (en desarrollo)",
                        icon: Icons.info,
                        color: Colors.blue,
                      );
                    },

                    onDelete: () {
                      ActionsDeleteWidget.show(
                        context: context,
                        deleteLabel: '¿Deseas eliminar el predio?',
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
