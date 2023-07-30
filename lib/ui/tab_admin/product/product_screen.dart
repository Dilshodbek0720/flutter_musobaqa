import 'package:flutter/material.dart';

class ProductsAdminScreen extends StatefulWidget {
  const ProductsAdminScreen({super.key});

  @override
  State<ProductsAdminScreen> createState() => _ProductsAdminScreenState();
}

class _ProductsAdminScreenState extends State<ProductsAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Admin Screen"),
      ),
    );
  }
}
