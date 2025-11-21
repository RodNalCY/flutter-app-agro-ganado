import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class ProductoHistorialPage extends StatefulWidget {
  const ProductoHistorialPage({Key? key}) : super(key: key);

  @override
  _ProductoHistorialPageState createState() => _ProductoHistorialPageState();
}

class _ProductoHistorialPageState extends State<ProductoHistorialPage> {
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
                    hintText: "Buscar Noticia...",
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
    );
  }

  Widget buildCardList(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FlushbarWidget.show(
          context: context,
          message: "Seleccionado",
          icon: Icons.info,
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transporte a planta de procesamiento",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "15/10/2025",
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.edit),
              SizedBox(width: 5),
              Icon(Icons.delete),
            ],
          ),
        ),
      ),
    );
  }
}
