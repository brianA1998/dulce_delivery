import 'package:dulces_delivery/objects/product.dart';
import 'package:dulces_delivery/widgets/side_bar_widget.dart';
import 'package:flutter/material.dart';

class ProductNewScreen extends StatefulWidget {
  final Product product;
  ProductNewScreen(this.product);
  @override
  _ProductNewScreenState createState() => _ProductNewScreenState();
}

class _ProductNewScreenState extends State<ProductNewScreen> {
  List<Product> items;
  TextEditingController _name;
  TextEditingController _price;
  TextEditingController _cuantity;
  TextEditingController _description;

  @override
  void initState() {
    _name = TextEditingController(text: widget.product.name);
    _price = TextEditingController(text: widget.product.price.toString());
    _cuantity = TextEditingController(text: widget.product.cuantity.toString());
    _description = TextEditingController(text: widget.product.description);

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _cuantity.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffD2B48C),
          centerTitle: true,
          elevation: 20.0,
          title: Text('Nuevo Dulce'),
        ),
        drawer: SideBarWidget(),
        body: Center(
          child: Container(
            height: 600.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 20.0,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                    child: (widget.product.id != null)
                        ? Text(
                            "Editar dulce",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "Nuevo dulce",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
