import 'package:dulces_delivery/objects/product.dart';
import 'package:dulces_delivery/pages/products_page.dart';

import 'package:dulces_delivery/utils/constans.dart';
import 'package:dulces_delivery/widgets/side_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'products_page.dart';

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
        body: Container(
          height: 600.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 20.0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                  child: (widget.product.id != null)
                      ? _TextLabel(label: "Editar Dulce")
                      : _TextLabel(label: "Nuevo Dulce"),
                ),
                _nameProduct(),
                _priceProduct(),
                _cuantityProduct(),
                _descriptionProduct(),
                SizedBox(height: 10.0),
                _buttonProduct(),
              ],
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
          maxLines: 3,
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

  Widget _buttonProduct() {
    // ignore: deprecated_member_use
    return FlatButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: (widget.product.id != null)
            ? _TextLabel(
                label: 'Actualizar',
                colorLetter: Colors.white,
              )
            : _TextLabel(
                label: 'Agregar',
                colorLetter: Colors.white,
              ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: colorPastel,
      onPressed: () {
        setState(() {
          _addProduct();
        });
      },
    );
  }

  void _addProduct() {
    try {
      if (widget.product.id != null) {
        productReference.child(widget.product.id).set({
          'name': _name.text,
          'price': _price,
          'cuantity': _cuantity,
          'description': _description.text
        }).then(
          (_) => Navigator.pop(context),
        );
      } else {
        productReference.push().set({
          'name': _name.text,
          'price': _price.text,
          'cuantity': _cuantity.text,
          'description': _description.text
        }).then(
          (_) => Navigator.pop(context),
        );
      }
    } catch (e) {
      _showDialog();
    }
  }
}

void _showDialog() {
  showDialog(
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Error"),
        actions: [
          Expanded(
            // ignore: deprecated_member_use
            child: FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      );
    },
    context: null,
  );
}

// ignore: must_be_immutable
class _TextLabel extends StatefulWidget {
  final String label;
  Color colorLetter;
  _TextLabel({this.label, this.colorLetter = Colors.black});

  @override
  __TextLabelState createState() => __TextLabelState();
}

class __TextLabelState extends State<_TextLabel> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: widget.colorLetter),
    );
  }
}
