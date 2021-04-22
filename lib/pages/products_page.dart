import 'package:dulces_delivery/widgets/side_bar_widget.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffD2B48C),
        centerTitle: true,
        elevation: 20.0,
        title: Text('Dulce Delivery'),
      ),
      drawer: SideBarWidget(),
      body: Center(),
    );
  }
}
