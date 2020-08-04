class Product {
  final String name;
  final double price;
  final String productId;

  Product({this.name, this.price, this.productId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'productId': productId,
    };
  }

  Product.fromFiresstore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        price = firestore['price'],
        productId = firestore['prroductId'];
}
