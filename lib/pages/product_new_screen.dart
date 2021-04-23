import 'package:dulces_delivery/objects/product.dart';
import 'package:dulces_delivery/utils/constans.dart';
import 'package:dulces_delivery/widgets/side_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          backgroundColor: colorPastel,
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
                        ? _TextLabel("Editar Dulce")
                        : _TextLabel("Nuevo Dulce"),
                  ),
                  _nameProduct(),
                  _priceProduct(),
                  _cuantityProduct(),
                  _descriptionProduct(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
          controller: _name,
          style: TextStyle(fontSize: 20.0, color: Colors.black),
          decoration: InputDecoration(
            icon: Icon(
              FontAwesomeIcons.candyCane,
              color: colorPastel,
            ),
            labelText: 'Nombre del producto',
            labelStyle: TextStyle(color: colorPastel),
          )),
    );
  }

  Widget _priceProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
          keyboardType: TextInputType.number,
          controller: _price,
          style: TextStyle(fontSize: 20.0, color: Colors.black),
          decoration: InputDecoration(
            icon: Icon(
              FontAwesomeIcons.dollarSign,
              color: colorPastel,
            ),
            labelText: 'Precio del producto',
            labelStyle: TextStyle(color: colorPastel),
          )),
    );
  }

  Widget _cuantityProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
          keyboardType: TextInputType.number,
          controller: _cuantity,
          style: TextStyle(fontSize: 20.0, color: Colors.black),
          decoration: InputDecoration(
            icon: Icon(
              FontAwesomeIcons.balanceScaleRight,
              color: colorPastel,
            ),
            labelText: 'Cantidad del producto',
            labelStyle: TextStyle(color: colorPastel),
          )),
    );
  }

  Widget _descriptionProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
          maxLines: 4,
          controller: _description,
          style: TextStyle(fontSize: 20.0, color: Colors.black),
          decoration: InputDecoration(
            icon: Icon(
              FontAwesomeIcons.database,
              color: colorPastel,
            ),
            labelText: 'Descripcion del producto',
            labelStyle: TextStyle(color: colorPastel),
          )),
    );
  }
}

class _TextLabel extends StatelessWidget {
  final String label;
  _TextLabel(this.label);
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
}
