import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations_with_provider/model/product.dart';

class Database {
  Firestore _db = Firestore.instance;

  Future<void> saveProducts(Product product) async {
    return await _db.collection('products').document(product.productId).setData(
          product.toMap(),
        );
  }

  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (document) => Product.fromFiresstore(document.data),
              )
              .toList(),
        );
  }

  Future<void> removeProduct(String productId) {
    return _db.collection('products').document(productId).delete();
  }
}
