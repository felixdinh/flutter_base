import 'package:flutter/material.dart';
import 'package:flutter_base/data/models/category.dart';
import 'package:flutter_base/routes/route_path.dart';
import 'package:flutter_base/screens/login/bloc/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = CategoryModel.categories;
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        actions: [
          IconButton(
              onPressed: () => context.read<LoginCubit>().logout(),
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          CategoryModel category = categories[index];
          return ListTile(
            title: Text(category.name),
            onTap: () => context.go(
              context.namedLocation(
                RouteName.products,
                params: {'category': category.name},
                queryParams: {
                  'sort': 'asc',
                  'filter': '0',
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
