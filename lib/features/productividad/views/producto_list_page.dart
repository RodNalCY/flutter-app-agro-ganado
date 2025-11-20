import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_buttons_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/actions_delete_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:proinnovate_flutter_app/features/productividad/views/producto_home_page.dart';

class ProductoListPage extends StatefulWidget {
  const ProductoListPage({Key? key}) : super(key: key);

  @override
  _ProductoListPageState createState() => _ProductoListPageState();
}

class _ProductoListPageState extends State<ProductoListPage> {
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
                    hintText: "Buscar producto...",
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
          NavigatorWidget.pushWithSlideUp(context, ProductoHomePage());
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
                "https://scontent.flim2-2.fna.fbcdn.net/v/t1.6435-9/129629155_1606298119575963_6127348836122216384_n.jpg?stp=dst-jpg_s640x640_tt6&_nc_cat=102&ccb=1-7&_nc_sid=3a1ebe&_nc_ohc=5_BmOZPMd6EQ7kNvwFUXrOk&_nc_oc=Adn54beC1u5r09NOJFXv8G14ooh7adNyt7qco31w_SVzbrkp0KCjRmfXcAkpXyIMCy81tBnluZ5iSu2Nm8QsMAnV&_nc_zt=23&_nc_ht=scontent.flim2-2.fna&_nc_gid=uAg6PatWKJxmCbflrSDZDQ&oh=00_AfjG2s8Gj5kAyoQpnuXP5Ig5grayUjp0NbVxrjTf2AX-rg&oe=6946F339",
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
                    "LEC-123456",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "Leche para venta internacional",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Divider(),
                  // ROW REGISTRO HAPPY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.pets, size: 20),
                      Text("BOV-2345678", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  // ROW ENFERMEDAD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.domain, size: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GLORIA S.A",
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
}
