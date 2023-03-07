import 'package:flutter/material.dart';
import 'package:flutter_base/data/models/category.dart';
import 'package:flutter_base/data/models/product.dart';
import 'package:flutter_base/routes/route_path.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatelessWidget {
  final String category;
  final bool asc;
  final int quantity;

  const ProductListScreen({
    Key? key,
    required this.category,
    required this.asc,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductModel.products
        .where((product) => product.category == category)
        .where((product) => product.quantity > quantity)
        .toList();
    products.sort((a, b) => asc ? b.name.compareTo(a.name) : a.name.compareTo(b.name));
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              String sort = asc ? 'desc' : 'asc';
              return context.goNamed(
                RouteName.products,
                params: {'category': category},
                queryParams: {'sort': sort}
              );
            },
            icon: Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {
              return context.goNamed(
                  RouteName.products,
                  params: {'category': category},
                  queryParams: {'filter': {'10'}}
              );
            },
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(products[index].name));
        },
      ),
    );
  }
}
