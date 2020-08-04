import 'package:crud_operations_with_provider/model/product.dart';
import 'package:crud_operations_with_provider/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final database = Database();
  String _name;
  double _price;
  String _productId;
  var uuid = Uuid();

//getters:
  String get name => _name;
  double get price => _price;

//Setters:
  changeName(String name) {
    _name = name;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  loadValues(Product product) {
    _name = product.name;
    _price = product.price;
    _productId = product.productId;
  }

  saveProduct() {
    //add new product
    if (_productId == null) {
      var newProduct = Product(
        name: name,
        price: price,
        productId: uuid.v4(),
      );
      database.saveProducts(newProduct);
    }
    //update product
    else {
      var updatedProduct = Product(
        name: name,
        price: price,
        productId: _productId,
      );
      database.saveProducts(updatedProduct);
    }
  }

  removeProduct(String productId) {
    database.removeProduct(productId);
  }
}
