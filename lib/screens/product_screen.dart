import 'package:crud_operations_with_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_product_screen.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: products == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.name),
                      trailing: Text(
                        product.price.toString(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProductScreen(product),
                          ),
                        );
                      },
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProductScreen(),
            ),
          );
        },
      ),
    );
  }
}
