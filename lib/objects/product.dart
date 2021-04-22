import 'package:firebase_database/firebase_database.dart';

class Product {
  Product(this._idProduct, this._nameProduct, this._priceProduct,
      this._cuantityProduct, this._descriptionProduct);

  String _idProduct;
  String _nameProduct;
  int _priceProduct;
  int _cuantityProduct;
  String _descriptionProduct;

  Product.map(dynamic obj) {
    this._nameProduct = obj['nameProduct'];
    this._priceProduct = obj['priceProduct'];
    this._cuantityProduct = obj['cuantityProduct'];
    this._descriptionProduct = obj['descriptionProduct'];
  }

  String get id => _idProduct;
  String get name => _nameProduct;
  int get price => _priceProduct;
  int get cuantity => _cuantityProduct;
  String get description => _descriptionProduct;

  Product.fromSnapShot(DataSnapshot snapshot) {}
}
