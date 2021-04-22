import 'package:dulces_delivery/pages/products_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: ProductsPage.id,
      routes: {
        ProductsPage.id: (context) => ProductsPage(),
      },
    );
  }
}
