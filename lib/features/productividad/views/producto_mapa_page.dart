import 'package:flutter/material.dart';

class ProductoMapaPage extends StatefulWidget {
  const ProductoMapaPage({Key? key}) : super(key: key);

  @override
  _ProductoMapaPageState createState() => _ProductoMapaPageState();
}

class _ProductoMapaPageState extends State<ProductoMapaPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.network(
        "https://i.pinimg.com/564x/22/c2/a5/22c2a5d074bd50524200db21eff8a53a.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
