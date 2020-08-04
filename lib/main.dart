import 'package:crud_operations_with_provider/providers/products_provider.dart';
import 'package:crud_operations_with_provider/screens/product_screen.dart';
import 'package:crud_operations_with_provider/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final database = Database();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        StreamProvider(create: (context) => database.getProducts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD Operations',
        theme: ThemeData(),
        home: ProductsPage(),
      ),
    );
  }
}
