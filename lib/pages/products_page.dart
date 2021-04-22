import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  static String id = 'productos_page';
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD2B48C),
        centerTitle: true,
        elevation: 20.0,
        title: Text('Dulce Delivery'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Image.asset('assets/img/logo.jpeg')],
              ),
              decoration: BoxDecoration(color: Color(0xffDEB887)),
            ),
          ],
        ),
      ),
      body: Center(),
    );
  }
}
