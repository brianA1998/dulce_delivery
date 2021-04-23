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
  List<Product> items;
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
    return SafeArea(
      child: Scaffold(
        drawer: SideBarWidget(),
        body: CustomScrollView(
          physics: ScrollPhysics(),
          primary: true,
          slivers: [
            SliverAppBar(
              title: Text("Productos"),
              backgroundColor: Color(0xffF58020),
              floating: true,
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int position) {
                  return Card();
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          elevation: 15.0,
          backgroundColor: Color(0xffD2B48C),
          onPressed: () => _createNewProduct(context),
        ),
      ),
    );
  }

  void _onProductAdded(Event event) {
    setState(() {
      items.add(new Product.fromSnapShot(event.snapshot));
    });
  }

  void _onProductUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new Product.fromSnapShot(event.snapshot);
    });
  }

  //Metodo para pasar a la siguiente pantalla
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
