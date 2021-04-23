import 'package:dulces_delivery/objects/product.dart';
import 'package:dulces_delivery/pages/product_new_screen.dart';
import 'package:dulces_delivery/widgets/side_bar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsPage extends StatefulWidget {
  static String id = 'productos_page';
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

final productReference = FirebaseDatabase.instance.reference().child('dulces');

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD2B48C),
        centerTitle: true,
        elevation: 20.0,
        title: Text('Dulce Delivery'),
      ),
      drawer: SideBarWidget(),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        elevation: 15.0,
        backgroundColor: Color(0xffD2B48C),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }

  void _createNewProduct(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductNewScreen(
          Product(null, '', 0, 0, ''),
        ),
      ),
    );
  }
}
