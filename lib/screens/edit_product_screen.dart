import 'package:crud_operations_with_provider/model/product.dart';
import 'package:crud_operations_with_provider/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  EditProductScreen([this.product]);
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.product == null) {
      //New Record
      nameController.text = "";
      priceController.text = "";
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(Product());
      });
    } else {
      //State Update
      nameController.text = widget.product.name;
      priceController.text = widget.product.price.toString();
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.product);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Product name'),
              onChanged: (value) => product.changeName(value),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(hintText: 'Price'),
              keyboardType: TextInputType.number,
              onChanged: (value) => product.changePrice(value),
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                //FocusScope.of(context).unfocus();

                product.saveProduct();
                Navigator.pop(context);
              },
            ),
            //if (widget.product != null)
            RaisedButton(
              child: Text('Delete'),
              onPressed: () {
                product.removeProduct(widget.product.productId);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
