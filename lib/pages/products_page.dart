import 'dart:async';

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
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangeSubscription;

  @override
  void initState() {
    // ignore: deprecated_member_use
    items = new List();
    _onProductAddedSubscription =
        productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangeSubscription =
        productReference.onChildAdded.listen(_onProductUpdate);
    super.initState();
  }

  @override
  void dispose() {
    _onProductAddedSubscription.cancel();
    _onProductChangeSubscription.cancel();
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

  // ignore: unused_element
  Future<void> _deleteProduct(
      BuildContext context, Product product, int position) async {
    await productReference.child(product.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.pushNamed(context, ProductsPage.id);
      });
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
