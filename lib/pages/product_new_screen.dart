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
      ),
    );
  }
}
