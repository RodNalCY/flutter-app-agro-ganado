import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewsPage> {
  int isLike = 10;

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
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 160,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://scontent.cdninstagram.com/v/t39.30808-6/489910244_1085627270271244_5860429314276861439_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=105&ig_cache_key=MzQ4NzM0NTc2NTQxNzg5NTIzNA%3D%3D.3-ccb7-5&ccb=7-5&_nc_sid=58cdad&efg=eyJ2ZW5jb2RlX3RhZyI6InhwaWRzLjEwODB4MTM1MS5zZHIuQzMifQ%3D%3D&_nc_ohc=tI0FajeJo1MQ7kNvwEhnpTp&_nc_oc=AdncRZJZwyK5-nKLxZAM9Mqh6Fc7soroPE8Gnmvh8XzlsMG0cDxjwrN9d0Wxsfo-bWQlbr6pcx4wnleWtI51k1P1&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&_nc_gid=yxNqEWpujj_D9YEfngiNbA&oh=00_Afj8TDWiRpESIosErIWuEoInxlPIzpbXtmOPNIAL5JindQ&oe=69252FF3",
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
                        "Brote de coronavirus vacuno",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Divider(),
                      // ROW REGISTRO HAPPY
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.",
                          style: TextStyle(fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      isLike += 1;
                    });
                  },
                  icon: const Icon(
                    Icons.thumb_up,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: Text(
                    isLike.toString(),
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  iconAlignment: IconAlignment.start,
                ),

                TextButton.icon(
                  onPressed: () {
                    FlushbarWidget.show(
                      context: context,
                      message: "Fecha de publicación: 20/10/2025 11:19",
                      icon: Icons.calendar_month,
                      color: Colors.blue,
                    );
                  },
                  icon: const Icon(Icons.timer, size: 20, color: Colors.black),
                  label: const Text(
                    "20/10/2025 11:19",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  iconAlignment: IconAlignment.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
